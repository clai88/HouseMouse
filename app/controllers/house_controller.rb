class HouseController < ApplicationController
  def create
    @house = House.new(house_params)
    if @house.save
      redirect_to house_search_path(@house.id)
    else
      :search
    end
  end

  def search
    
  end

  def show

  end
end
