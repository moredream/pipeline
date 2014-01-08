class ProfilesController < ApplicationController
  before_filter :find_user, only: [:show, :edit]

  def new
    @user = current_user
    @profile = @user.profile || @user.build_profile

  end

  def create
  #  @user = User.find_by(slug: params[:id])
  #  @user = Profile.user.find_by(slug: params[:id])
   # @user = current_user
    @profile = current_user.build_profile(profile_params)

    if @profile .save!
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
  #  @user = User.find(params[:id])
    @profile  = Profile.find(params[:id])
    respond_to do |format|
    if @profile.update(profile_params)
        format.html { redirect_to profile_path(@profile.user), notice: 'Program was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end


private
# # Use callbacks to share common setup or constraints between actions.
  def find_user
    @user = User.find(params[:id])
 #   @user = User.find_by(slug: params[:id])
    @profile  = @user.profile || @user.build_profile
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def profile_params
    params.require(:profile).permit(:bio,:twitter,:linkedin,:google,:image,:mobile)
  end
end
