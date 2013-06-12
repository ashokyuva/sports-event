class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :card_type
      t.integer :card_num
      t.integer :ccv
      t.string :month
      t.integer :year
      t.integer :ticket_id

      t.timestamps
    end
  end
end
