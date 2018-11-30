require 'json'
require 'open-uri'

class Owner::CatsController < ApplicationController
  before_action :set_cat, only: [ :edit, :update, :destroy ]
  before_action :load_cat_breeds, only: [:new, :edit, :create]

  def index
    @cats = current_user.cats
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    @user = current_user
    @cat.user = @user

    if @cat.save
      flash[:notice] = "Cat successfully added"
      redirect_to owner_cats_path
    else
      flash[:alert] = "Please fill correctly the required fields!"
      render :new
    end
  end

  def edit
  end

  def update
    if @cat.update(cat_params)
      flash[:notice] = "Cat successfully updated"
      redirect_to owner_cats_path
    else
      flash[:alert] = "Please fill correctly the required fields!"
      render :edit
    end
  end

  def destroy
    @cat.destroy
    redirect_to owner_cats_path
  end

  private

  def set_cat
    @cat = Cat.find(params[:id])
  end

  def cat_params
    params.require(:cat).permit(:name, :breed, :description, :birth_date, :photo, :price_per_day, :address)
  end

  def load_cat_breeds
    @breeds = Cat::BREEDS
  end
end
