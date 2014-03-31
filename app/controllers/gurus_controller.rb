class GurusController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: [:show, :edit,:update,:destroy]
  
  def index

  end

  def new
    @guru = current_user.build_guru
  end

  def create
    @guru = current_user.build_guru(guru_params)
    if @guru.save
      redirect_to current_user, success: 'guru was successfully created'
    else
      render 'new'
    end
  end

  def show
  
  end

  def edit

  end

  def update
    if @guru.update(guru_params)
        redirect_to @guru, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @guru.destroy
    redirect_to root_url
  end

  private

    def guru_params
      params.require(:guru).permit(:name, :slug, :account, :link, :content)
    end
    def find_user
      @guru ||= current_user.guru
    end
end

