module ApplicationHelper

  def find_activity_name(activity_id)
    Activity.find_by(id: activity_id).name
  end

  def find_duration(reservation_id, activity_id)
    ra = ReservationActivity.find_by(reservation_id: reservation_id, activity_id: activity_id)
    if ra
      ra.duration
    else
      ''
    end
  end
end
