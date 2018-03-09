class Reservation < ApplicationRecord
  has_many :reservation_activities, dependent: :destroy
  has_many :activities, through: :reservation_activities

  accepts_nested_attributes_for :reservation_activities
  accepts_nested_attributes_for :activities

  def reservation_activities_attributes=(reservation_activity_attributes)
    reservation_activity_attributes.values.each do |reservation_activity_attribute|
      activity_attributes = reservation_activity_attribute["activities"]
      activity = Activity.find_or_create_by(name: activity_attributes["name"], description: activity_attributes["description"], custom: activity_attributes["custom"])
      reservation_activity = ReservationActivity.new(duration: reservation_activity_attribute["duration"], activity: activity)
      self.reservation_activities << reservation_activity
    end
  end

  def activity_ids=(ids)
    # ids.each do |id|
    #   if id.present?
    #     activity = Activity.find(id)
    #     self.activities << activity
    #   end
    # end
  end

  def durations=(ds)
    reservation_id = self.id
    if reservation_id.present?
      destroy_reservation_activities_by_reservation_id(reservation_id)
    end
    ds.each do |key, value|
      if value.present?
        activity = Activity.find_or_create_by(id: key)
        reservation_activity = ReservationActivity.new(duration: value, activity: activity)
        self.reservation_activities << reservation_activity
      end
    end
  end


  # def durations=(ds)
  #   reservation_id = self.id
  #   ds.each do |key, value|
  #     if value.present?
  #       activity = Activity.find_or_create_by(id: key)
  #       if reservation_id.present?
  #         reservation_activity = ReservationActivity.find_by(reservation_id: reservation_id, activity_id: activity.id)
  #         if reservation_activity
  #           reservation_activity.update(duration: value)
  #         else
  #           reservation_activity = ReservationActivity.new(duration: value, activity: activity)
  #           self.reservation_activities << reservation_activity
  #         end
  #       else
  #         reservation_activity = ReservationActivity.new(duration: value, activity: activity)
  #         self.reservation_activities << reservation_activity
  #       end
  #     end
  #   end
  # end

  private

  def destroy_reservation_activities_by_reservation_id(reservation_id)
    ReservationActivity.where(reservation_id: reservation_id).destroy_all
  end
end
