class SetReceiptDefaultCategoryToMeals < ActiveRecord::Migration
  def change
    change_column :receipts, :category, :string, default: 'Meals'
  end
end
