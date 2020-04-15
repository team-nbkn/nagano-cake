class CreateOrderInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :order_informations do |t|
      t.integer :payment_method
      t.integer :payment_amount
      t.integer :customer_id
      t.integer :status
      t.text :address
      t.string :postcode
      t.string :name

      t.timestamps
    end
  end
end
