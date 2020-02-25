class BookingsController < ApplicationController
  before_action :set_booking, only: %i[edit update destroy]
  def new
    @user = User.find(params[:user_id])
    @booking = Booking.new
  end

  def create
    user = User.find(params[:user_id])
    duck = Duck.find(params[:duck_id])
    booking = Booking.new(booking_params)
    booking.user = user
    booking.duck = duck
    if booking.save
      redirect_to user_path(user)
    else
      render :new
    end

    def edit
    end

    def update
      @booking.update
    end

    def destroy
      @booking.destroy
    end
  end

  private

  def booking_params
    params[:booking].permit(:date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
