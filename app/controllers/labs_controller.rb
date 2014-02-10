class LabsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_labs, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    respond_with(labs)
  end

  def new
    @lab = Lab.new
    respond_with(@lab)
  end

  def create
    @lab = current_user.labs.build(lab_params)
    flash[:notice] = 'User was successfully created.' if @lab.save
    respond_with(@lab)
  end

  def show
    respond_with(@lab)
  end

  def edit
    respond_with(@lab)
  end

  def update
    flash[:notice] = 'User was successfully created.' if @lab.update(lab_params)
    respond_with(@lab)
  end

  def destroy
    @lab.destroy
    redirect_to labs_url
  end

private
  def labs
    @labs ||= Lab.order(:name)
  end
  helper_method :labs

  def find_labs
    @lab = Lab.find(params[:id])
  end

  def lab_params
    params.require(:lab).permit(:name,:image,:remote_image_url, :content, :category_tokens, :category_ids=>[])
  end

end
