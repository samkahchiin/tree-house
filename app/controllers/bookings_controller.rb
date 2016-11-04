class BookingsController < ApplicationController
  def new
    render :new
  end

  def create
    Booking.create(booking_params)
  end

  private
  def booking_params
    params.require(:booking).permit(:first_name, :last_name, :identification_no, :phone_no, :email)
  end
end
