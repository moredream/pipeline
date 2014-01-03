class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
      @user = User.find(params[:id])
      @microposts = @user.microposts.paginate(page: params[:page])

      @user.build_profile unless @user.profile #To-Do
      @profile = @user.profile.bio
  end

end
