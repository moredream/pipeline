class GurusController < ApplicationController
before_filter :authenticate_user!

  def index

  end

  def new
    @guru = current_user.build_guru
  end

  def create
    @guru = current_user.build_guru(guru_params)
    if @guru.save
      redirect_to profile_path(current_user), success: 'guru was successfully created'
    else
      render 'new'
    end
  end

  def destroy
    @guru.destroy
    redirect_to root_url
  end

  private

    def guru_params
      params.require(:guru).permit(:name, :slug, :account, :link)
    end

end

