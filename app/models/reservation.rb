class Reservation < ApplicationRecord
  has_many :reservation_activities, dependent: :destroy
  has_many :activities, through: :reservation_activities

  accepts_nested_attributes_for :reservation_activities
  accepts_nested_attributes_for :activities

  def reservation_activities_attributes=(reservation_activity_attributes)
    reservation_activity_attributes.values.each do |reservation_activity_attribute|
      activity = Activity.find_or_create_by(reservation_activity_attribute["activity_id"])
      reservation_activity = ReservationActivity.new(duration: reservation_activity_attribute["duration"], activity: activity)
      self.reservation_activities << reservation_activity
    end
  end

  def activity_ids=(ids)
    raise 'info'.inspect
    ids.each do |id|
      if id.present?
        activity = Activity.find(id)
        self.activities << activity
      end
    end
  end
end
