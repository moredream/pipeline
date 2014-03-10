class PapersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_paper, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    respond_with(papers)
  end

  def new
    @paper = Lab.new
    respond_with(@paper)
  end

  def create
    @paper = current_user.labs.build(lab_params)
    flash[:notice] = 'User was successfully created.' if @paper.save
    respond_with(@paper)
  end

  def show
    respond_with(@paper)
  end

  def edit
    respond_with(@paper)
  end

  def update
    flash[:notice] = 'User was successfully created.' if @paper.update(lab_params)
    respond_with(@paper)
  end

  def destroy
    @paper.destroy
    redirect_to labs_url
  end

private
  def papers
    @papers ||= Paper.trending.page(params[:page]).per(2)
  end
  helper_method :papers

  def find_paper
    @paper = Lab.find(params[:id])
  end

  def lab_params
    params.require(:lab).permit(:name,:image,:remote_image_url, :content, :category_tokens, :category_ids=>[])
  end

end
