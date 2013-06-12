class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :user_id
      t.boolean :is_cricket,:default=> false
      t.boolean :is_football,:default=> false
      t.boolean :is_hockey,:default=> false
      t.boolean :is_tennis,:default=> false
      t.boolean :is_volleyball,:default=> false

      t.timestamps
    end
  end
end
