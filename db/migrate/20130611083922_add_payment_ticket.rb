class AddPaymentTicket < ActiveRecord::Migration
  def up
    add_column :tickets, :is_payment, :boolean,:default=>false
  end

  def down
  end
end
