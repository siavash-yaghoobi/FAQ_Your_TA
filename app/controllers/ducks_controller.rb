class DucksController < ApplicationController
  def index
    @ducks = Duck.all
  end

  def new
    @user = User.find([params[:user_id]])
    @duck = Duck.new
  end

  def create
    @duck = Duck.new(duck_params)
    @duck.user = current_user
    @duck.save
    if @duck.save
      redirect :duck_path
    else
      render :new
    end
  end

  private
  def duck_params
    params.require(:duck).permit(:name, :category, :description)
  end
end
