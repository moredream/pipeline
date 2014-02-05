class ProfilesController < ApplicationController
  before_action :find_user, only: [:show, :edit]

  def new
    @user = current_user
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save!
      redirect_to  current_user , notice: "Thank you for your profile!"
    else
      render "new"
    end
  end

  def show

  end

  def edit

  end

  def update
    @profile  = Profile.find(params[:id])

    if @profile.update(profile_params)

      if params[:profile][:image].present?
        render :crop
      else
        redirect_to profile_path(@profile.user), notice: 'Profile was successfully updated.'
      end

      # if remotipart_submitted?
      #   respond_to do |format|
      #     format.html {redirect_to profile_path(@profile.user), notice: 'Profile was successfully updated.'}
      #     format.js
      #   end
      # else
      #   redirect_to profile_path(@profile.user), notice: 'Profile was successfully updated.'
      # end
    else
      render action: 'edit'
    end
  end


private
# # Use callbacks to share common setup or constraints between actions.

  def find_user
    @user = User.find(params[:id])
    @profile = @user.profile
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def profile_params
    params.require(:profile).permit(:bio,:url, :lab, :twitter,:linkedin,:google,:image,:remote_image_url,:mobile, :crop_x,:crop_y,:crop_w,:crop_h)
  end
end
