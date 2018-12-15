class Cafes < ActiveRecord::Migration[5.2]
  def change
    create_table :cafes do |t|
      t.text :name
      t.text :address
      t.text :homepage
      t.integer :a_hour_price
      t.integer :prefecture
      t.timestamps
    end
  end
end