class AddFieldAmountToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :amount, :integer
    add_column :payments, :discount, :integer
    add_column :payments, :total, :integer
  end
end
