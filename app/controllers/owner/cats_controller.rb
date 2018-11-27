class Owner::CatsController < ApplicationController
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

  private

  def cat_params
    params.require(:cat).permit(:name, :breed, :description, :birth_date, :photo, :price_per_day)
  end

end
