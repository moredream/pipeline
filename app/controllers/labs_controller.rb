class LabsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_labs, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json


  def index
    @labs = Lab.all
    respond_with(@labs)
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
  def lab_params
    params.require(:lab).permit(:name, :url, :head, :content, :category_ids=>[])
  end

  def find_labs
    @lab = Lab.find(params[:id])
  end


end
