class Owner::CatsController < ApplicationController
  before_action :set_cat, only: [:edit, :update]

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    @user = current_user
    @cat.user = @user

    if @cat.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @cat.update(cat_params)
      redirect_to owner_cats_path
    else
      render :edit
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :breed, :description, :birth_date, :photo, :price_per_day)
  end

  def set_cat
    @cat = Cat.find(params[:id])
  end

end
