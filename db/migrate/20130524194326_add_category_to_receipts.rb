class AddCategoryToReceipts < ActiveRecord::Migration
  def change
    add_column :receipts, :category, :string
  end
end
