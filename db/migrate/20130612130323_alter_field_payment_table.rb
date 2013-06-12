class AlterFieldPaymentTable < ActiveRecord::Migration
  def change
    change_column :payments, :card_num, :string
  end
end
