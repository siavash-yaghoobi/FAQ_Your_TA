class DucksController < ApplicationController
  before_action :set_duck, only: %i[show edit destroy]
  def index
    @ducks = Duck.all
  end

  def show
  end

  def new
    @duck = Duck.new
  end

  def edit
  end

  def update
    @duck.update
    redirect_to duck_path(@duck)
  end

  def create
    @duck = Duck.new(duck_params)
    @duck.user = current_user
    @duck.save
    if @duck.save
      redirect_to duck_path(@duck)
    else
      render :new
    end
  end

  def destroy
    @duck.destroy
    redirect_to ducks_path
  end

  private
  def duck_params
    params.require(:duck).permit(:name, :category, :description)
  end

  def set_duck
    @duck = Duck.find(params[:id])
  end
end
