class CreateHouses < ActiveRecord::Migration[5.0]
  def change
    create_table :houses do |t|
      t.integer :zpid
      t.string :street_address
      t.integer :zip
      t.string :city_state_string
      t.boolean :starred
      t.integer :amount_of_times_searched

      t.timestamps
    end
  end
end
