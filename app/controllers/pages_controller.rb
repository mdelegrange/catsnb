class PagesController < ApplicationController
  def home
    @is_home = params[:controller] == "pages" && params[:action] == "home"
  end
end
