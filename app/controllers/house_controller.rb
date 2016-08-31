class HouseController < ApplicationController
  def index
    @page = params[:page].to_i
    @houses = current_user.user_houses.order(created_at: :desc)
    @user_houses = @houses.page(@page).per(5)
  end

  def create
    a = house_params["street_address"]
    a.upcase.downcase!.strip!

    @house = House.where(house_params).first_or_initialize
    if user_signed_in? && @house.save
      UserHouse.create(user_id: current_user.id, house_id: @house.id)
      redirect_to house_path(@house.id)
    elsif !user_signed_in? && @house.save
      redirect_to house_path(@house.id)
    else
      render :new
    end
  end

  def search

  end

  def show
    @house = House.find_by(id: params["id"])
    search = HouseHelper::GetSearch.new(@house.street_address,@house.zip)
    # binding.pry
    @status_code = search.get_error_code
    unless search.get_house_info["searchresults"]["message"]["code"] == "0"
      render :house_not_found
      return
    end
    @zpid_lat_long = search.get_zpid
    @house.update(zpid: @zpid_lat_long[0])
    @params = HouseHelper::GetDeepComps.new(@zpid_lat_long[0]).get_specific_parameters

    @walk_score = walk_score(@house.street_address, @params["address"]["city"], @params["address"]["state"],@house.zip,
    @params["address"]["latitude"],
    @params["address"]["longitude"])
  end

  def mortgage_info
  end

  def walk_score(address,city,state,zip,lat,long)
    HouseHelper::WalkScore.new(address,
    city + " " + state, zip, lat, long).get_walk_score
  end

  def destroy_search
    # binding.pry
    UserHouse.find_by(user_id: params["user_id"], house_id: params["house_id"]).destroy

    redirect_to house_index_path
  end

  def star
    record = UserHouse.find_by(user_id: params["user_id"], house_id: params["house_id"])
    star = record.starred
    record.update(starred: !star)

    redirect_to house_index_path
  end

  def description
    house = UserHouse.find_by(user_id: params["user_id"], house_id: params["house_id"])
    house.update(user_house_params)
    redirect_to house_index_path
  end


  private def house_params
    params.require("house").permit(:street_address, :zip)
  end

  private def user_house_params
    params.require("user_house").permit(:description)
  end
end
