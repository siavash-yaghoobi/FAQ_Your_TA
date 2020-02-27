class BookingsController < ApplicationController
  before_action :set_booking, only: %i[edit update destroy]

  def index
    @bookings = policy_scope(Booking)
  end

  def show
    @booking = Booking.new
    authorize @booking
  end

  def create
    @duck = Duck.find(params[:duck_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.duck = @duck
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end

    def edit
    end

    def update
      @duck = Duck.find(params[:duck_id])
      @booking.update
      redirect_to duck_path(@duck)
    end

    def destroy
      @booking.destroy
    end
  end

  private

  def booking_params
    params[:booking].permit(:starts_at, :ends_at)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
