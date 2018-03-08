class ReservationActivity < ApplicationRecord
  belongs_to :reservation
  belongs_to :activity
end
