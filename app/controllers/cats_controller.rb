class CatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_cat, only: [:show]

  def index
    @cats = Cat.where.not(latitude: nil, longitude: nil)

    @markers = @cats.map do |cat|
      {
        lat: cat.latitude,
        lng: cat.longitude
      }
    end

    # if params[:query].present?
    #   @cats = Cat.where("name ILIKE ?", "%#{params[:query]}%")
    # else
    #   @cats = Cat.all
    # end
  end

  def show
    @owner_avatar = User.find_by_id(@cat.user_id).photo
    @owner_name = User.find_by_id(@cat.user_id).first_name + " " + User.find_by_id(@cat.user_id).last_name
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :breed, :photo, :description, :birth_date)
  end

  def set_cat
    @cat = Cat.find(params[:id])
  end
end
