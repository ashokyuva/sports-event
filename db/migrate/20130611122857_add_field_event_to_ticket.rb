class AddFieldEventToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :event_name, :string
  end
end
