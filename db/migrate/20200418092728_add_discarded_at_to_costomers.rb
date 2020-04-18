class AddDiscardedAtToCostomers < ActiveRecord::Migration[5.2]
  def change
    add_column :costomers, :discarded_at, :datetime
    add_index :costomers, :discarded_at
  end
end
