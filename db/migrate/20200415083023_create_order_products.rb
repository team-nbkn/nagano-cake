class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.integer :price
      t.integer :quantity
      t.integer :status
      t.integer :product_id
      t.integer :order_information_id

      t.timestamps
    end
  end
end
