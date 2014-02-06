class ProfilesController < ApplicationController
  before_action :find_user, only: [:show, :edit]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end


private
# # Use callbacks to share common setup or constraints between actions.

  def find_user
    @user = User.find(params[:id])
    @profile = @user.profile
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def profile_params
    params.require(:profile).permit(:bio,:url, :lab, :twitter,:linkedin,:google,:mobile)
  end
end
