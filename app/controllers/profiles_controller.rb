class ProfilesController < ApplicationController
  before_action :find_user, only: [:show, :edit]

  def show

  end

  def edit

  end

  def update
    @profile  = Profile.find(params[:id])

    if @profile.update(profile_params)

      # if remotipart_submitted?
      #   respond_to do |format|
      #     format.html {redirect_to profile_path(@profile.user), notice: 'Profile was successfully updated.'}
      #     format.js
      #   end
      # else
      #   redirect_to profile_path(@profile.user), notice: 'Profile was successfully updated.'
      # end
      redirect_to profile_path(@profile.user), notice: 'Profile was successfully updated.'
    else
      render action: 'edit'
    end
  end


private
# # Use callbacks to share common setup or constraints between actions.

  def find_user
    @user = User.find(params[:id])
    @profile = @user.profile || @user.build_profile
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def profile_params
    params.require(:profile).permit(:bio,:url, :lab, :twitter,:linkedin,:google,:mobile)
  end
end
