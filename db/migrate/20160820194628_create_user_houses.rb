class CreateUserHouses < ActiveRecord::Migration[5.0]
  def change
    create_table :user_houses do |t|
      t.string :user_id
      t.integer :house_id
      t.boolean :starred
      t.text :description

      t.timestamps
    end
  end
end
