class SetReceiptDefaultAmountToZero < ActiveRecord::Migration
  def change
    change_column :receipts, :amount, :float, default: 0.0
  end
end
