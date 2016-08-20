class HouseController < ApplicationController
  def create
    house_params["street_address"].downcase!
    @house = House.new(house_params)

    same_house = House.find_by(street_address: house_params["street_address"])
    if same_house
      if user_signed_in? && @house.valid?
        UserHouse.create(user_id: current_user.id, house_id: same_house.id)
        redirect_to house_path(same_house.id)
      elsif !user_signed_in? && @house.valid?
        redirect_to house_path(same_house.id)
      else
        :show
      end
    else #new house
      if user_signed_in? && @house.save
        UserHouse.create(user_id: current_user.id, house_id: @house.id)
        redirect_to house_path(@house.id)
      elsif !user_signed_in && @house.save
        redirect_to house_path(@house.id)
      else
        :show
      end
    end
  end

  def search

  end

  def show
    @house = House.find_by(id: params["id"])
    search = HouseHelper::GetSearch.new(@house.street_address,@house.zip)
    @zpid_lat_long = search.get_zpid
    @house.update(zpid: @zpid_lat_long[0])
    @params = HouseHelper::GetDeepComps.new(@zpid_lat_long[0]).get_specific_parameters

    @walk_score = walk_score(@house.street_address, @params["address"]["city"], @params["address"]["state"],@house.zip,
    @params["address"]["latitude"],
    @params["address"]["longitude"])
  end

  def walk_score(address,city,state,zip,lat,long)
    HouseHelper::WalkScore.new(address,
    city + " " + state, zip, lat, long).get_walk_score
  end

  private def house_params
    params.require("house").permit(:zpid, :street_address, :zip, :city_state)
  end
end
