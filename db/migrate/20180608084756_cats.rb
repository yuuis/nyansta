class Cats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.text :name
      t.date :birth_date
      t.text :gender
      t.text :image
      t.integer :breed_id
      t.integer :cafe_id
    end
  end
end
