class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.float :amount
      t.datetime :receipt_date
    end
  end
end
