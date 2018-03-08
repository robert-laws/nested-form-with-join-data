class Reservation < ApplicationRecord
  has_many :reservation_activities, dependent: :destroy
  has_many :activities, through: :reservation_activities
end
