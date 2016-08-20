class ChangeCityStateString < ActiveRecord::Migration[5.0]
  def change
    rename_column :houses, :city_state_string, :city_state
  end
end
