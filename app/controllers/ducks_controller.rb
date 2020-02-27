class DucksController < ApplicationController
  before_action :set_duck, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    if params[:query].present?
      @ducks = policy_scope(Duck.search_by_name_category_description(params[:query]))
    else
      @ducks = policy_scope(Duck)
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
