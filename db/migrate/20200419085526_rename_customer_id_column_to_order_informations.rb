class RenameCustomerIdColumnToOrderInformations < ActiveRecord::Migration[5.2]
  def change
  	rename_column :order_informations, :customer_id, :costomer_id
  end
end
