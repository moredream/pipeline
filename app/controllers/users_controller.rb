class UsersController < ApplicationController
  #before_action :set_profile, only: [:show]
  before_action :find_user, only: [:show, :edit,:update]
  # before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all

  end


  def show
      @profile = @user.profile
  end

  def edit

  end

  def update

    if @user.update(user_params)

      if params[:user][:image].present?
        render :crop
      else
        redirect_to @user, notice: 'User was successfully updated.'
      end
    else
      render action: 'edit'
    end
  end

private

  def set_profile
    if current_user.profile.nil?
      flash[:alert] = "Please complete your profile"
      new_profile_path
    end
  end

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username,:image,:remote_image_url,:mobile, :crop_x,:crop_y,:crop_w,:crop_h)
  end

end
