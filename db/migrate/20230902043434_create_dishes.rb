class CreateDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :dishes do |t|
      t.string :dish_name
      t.string :dish_description
      t.string :dish_type
      t.string :allergens
      t.string :category
      t.integer :price

      t.timestamps
    end
  end
end
