class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :content
      t.integer :price
      t.string :image_id
      t.integer :category_id
      t.integer :status

      t.timestamps
    end
  end
end
