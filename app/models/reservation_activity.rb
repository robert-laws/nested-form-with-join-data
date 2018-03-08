class ReservationActivity < ApplicationRecord
  belongs_to :reservation
  belongs_to :activity

  def self.total_duration_for_reservation(reservation_id)
    where("reservation_id = ?", reservation_id).collect { |ra| ra.duration }.inject(:+)
  end

  # scope :get_reservation_activity, ->(activity_id){ where("activity_id = ?", activity_id) }
end
