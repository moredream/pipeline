class UsersController < ApplicationController

  def index

    @users = User.all


  end


  def show
      @user = User.find(params[:id])
      @profile = @user.profile
      @microposts = @user.microposts.paginate(page: params[:page])

  end


end
