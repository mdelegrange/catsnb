require 'json'
require 'open-uri'

class Owner::CatsController < ApplicationController
  before_action :set_cat, only: [ :edit, :update, :destroy ]

  def index
    @cats = current_user.cats
  end

  def new
    @cat = Cat.new
    url = 'https://raw.githubusercontent.com/jfairbank/programming-elm.com/master/cat-breeds.json'
    breed_serialized = open(url).read
    @breed = JSON.parse(breed_serialized)
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

end
