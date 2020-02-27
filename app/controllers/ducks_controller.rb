class DucksController < ApplicationController
  before_action :set_duck, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @ducks = policy_scope(Duck)
    # @ducks = Duck.geocoded #returns flats with coordinates
    # @markers = @ducks.map do |duck|
    #   {
    #     lat: duck.latitude,
    #     lng: duck.longitude
    #     infoWindow: render_to_string(partial: "info_window", locals: { duck: duck })
    #   }
    # end
    if params[:query].present?
      @ducks = Duck.where.not( longitude:nil, latitude: nil).near(params[:query], 200)
    else
      @ducks = Duck.geocoded
    end
    @markers = @ducks.map do |duck|
       {
         lat: duck.latitude,
         lng: duck.longitude,
         infoWindow: render_to_string(partial: "info_window", locals: { duck: duck })
       }
     end
  end

  def show
    @booking = Booking.new
    authorize @duck
  end

  def new
    @duck = Duck.new
    authorize @duck
  end

  def edit
    authorize @duck
  end

  def update
    authorize @duck
    @duck.update(duck_params)
    redirect_to duck_path(@duck)
  end

  def create
    @duck = Duck.new(duck_params)
    @duck.user = current_user

    authorize @duck
    if @duck.save
      redirect_to duck_path(@duck)
    else
      render :new
    end
  end

  def destroy
    authorize @duck
    @duck.destroy
    redirect_to ducks_path
  end

  private
  def duck_params
    params.require(:duck).permit(:name, :category, :description, :price, :photo)
  end

  def set_duck
    @duck = Duck.find(params[:id])
  end
end
