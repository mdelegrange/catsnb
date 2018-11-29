class ProfilesController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "Profil successfully uptaded"
      redirect_to profile_path
    else
      flash[:alert] = "Please fill correctly
 the required fields!"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :address, :photo, :sex)
  end
end
