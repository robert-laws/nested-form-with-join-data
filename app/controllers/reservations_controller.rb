class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
    @total_time = ReservationActivity.total_duration_for_reservation(@reservation.id)
  end

  def new
    @reservation = Reservation.new
    @reservation_activities = @reservation.reservation_activities.build
    @activities = Activity.all
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      render :new
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
    @activities = Activity.all
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to reservation_path(@reservation)
    else
      render :new
    end
  end

  private

  def reservation_params
    # params.require(:reservation).permit(:date, :drop_off_time, :pick_up_time, reservation_activities_attributes: [:duration, :activity_id])
    params.require(:reservation).permit(:date, :drop_off_time, :pick_up_time, activity_ids: [], durations: {}, reservation_activities_attributes: [:duration, activities: [:name, :description, :custom]])
  end
end
