class UsersController < ApplicationController
  before_action :set_profile, only: [:show]

  def index
    @users = User.all

  end


  def show
      @user = User.find(params[:id])
      @profile = @user.profile
  end

private
# # Use callbacks to share common setup or constraints between actions.

  def set_profile
    if current_user.profile.nil?
      flash[:alert] = "Please complete your profile"
      new_profile_path
    end
  end

end
