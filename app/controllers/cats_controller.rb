class CatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_cat, only: [:show]

  def index
    if params[:query].present?
      @cats = Cat.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @cats = Cat.all
    end

  end

  def show
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :breed, :photo, :description, :birth_date)
  end

  def set_cat
    @cat = Cat.find(params[:id])
  end
end
