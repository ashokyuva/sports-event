class AddFieldToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :startdate, :date
    add_column :tickets, :enddate, :date
  end
end
