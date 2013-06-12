class AlterFieldPayment < ActiveRecord::Migration
  def change
    change_column :payments, :card_type, :string
  end
end
