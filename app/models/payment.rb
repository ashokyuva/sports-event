class Payment < ActiveRecord::Base
  attr_accessible :card_num, :card_type, :ccv, :month, :ticket_id, :year,:amount, :discount, :total
  belongs_to :ticket
end
