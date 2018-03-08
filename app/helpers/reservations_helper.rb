module ReservationsHelper
  def format_date(reservation)
    reservation.date.strftime("%B %e, %Y")
  end
end
