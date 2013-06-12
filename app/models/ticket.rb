class Ticket < ActiveRecord::Base
  attr_accessible :is_cricket, :is_football, :is_hockey, :is_tennis, :is_volleyball, :user_id, :startdate, :enddate,:event_name
  belongs_to :user
  has_one :payment
end
