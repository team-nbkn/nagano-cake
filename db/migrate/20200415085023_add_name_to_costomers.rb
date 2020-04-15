class AddNameToCostomers < ActiveRecord::Migration[5.2]
  def change
    add_column :costomers, :first_name, :string
    add_column :costomers, :last_name, :string
    add_column :costomers, :first_kana_name, :string
    add_column :costomers, :last_kana_name, :string
    add_column :costomers, :postcode, :string
    add_column :costomers, :address, :text
    add_column :costomers, :phone, :string
    add_column :costomers, :status, :integer
  end
end
