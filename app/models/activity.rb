class Activity < ApplicationRecord
  has_many :reservation_activities
  has_many :reservations, through: :reservation_activities
end
