class BookingsController < ApplicationController
  before_action :set_booking, only: %i[edit update destroy]

  def create
    @duck = Duck.find(params[:duck_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.duck = @duck
    authorize @booking
    if @booking.save
      redirect_to duck_path(@duck)
    else
      render :new
    end

    def edit
      authorize @booking
    end

    def update
      authorize @booking
      @duck = Duck.find(params[:duck_id])
      @booking.update(booking_params)
      redirect_to duck_path(@duck)
    end

    def destroy
      authorize @booking
      duck = @booking.duck
      @booking.destroy
      redirect_to duck_path(duck)
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
