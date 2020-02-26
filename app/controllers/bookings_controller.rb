class BookingsController < ApplicationController
  before_action :set_booking, only: %i[edit update destroy]

  def create
    authorize @booking
    @duck = Duck.find(params[:duck_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.duck = @duck
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
      @booking.update
      redirect_to duck_path(@duck)
    end

    def destroy
      authorize @booking
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
