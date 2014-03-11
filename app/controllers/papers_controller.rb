class PapersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_paper, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json, :js

  def index
    respond_with(papers)
  end

  def new
    @paper = Paper.new
    respond_with(@paper)
  end

  def create
    @paper = current_user.papers.build(paper_params)
    flash[:notice] = 'Paper was successfully created.' if @paper.save
    respond_with(@paper)
  end

  def show
    @commentable = @paper
    @comment = Comment.new
    @attachable = @paper
  end

  def edit
    respond_with(@paper)
  end

  def update
    flash[:notice] = 'Paper was successfully updated.' if @paper.update(paper_params)
    respond_with(@paper)
  end

  def destroy
    @paper.destroy
    redirect_to papers_path
  end

private
  def papers
    @papers ||= Paper.trending.page(params[:page]).per(2)
  end
  helper_method :papers

  def find_paper
    @paper = Paper.find(params[:id])
  end

  def paper_params
    params.require(:paper).permit(:title,:image, :content, :link,:original_filename)
  end

end
