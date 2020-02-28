class BookingsController < ApplicationController
  before_action :set_booking, only: %i[edit update destroy]

  def index
    @bookings = policy_scope(Booking)
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @booking = Booking.new
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
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
    @duck = @booking.duck
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    authorize @booking
    duck = @booking.duck
    @booking.destroy
    redirect_to duck_path(duck)
  end

  private

  def booking_params
    params[:booking].permit(:starts_at, :ends_at)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
