class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    #@articles = Article.trending(5)

    if params[:tag]
      @articles = Article.tagged_with(params[:tag])
    else
      @articles = Article.trending.includes(:tags)
    end
    @article.build_tag if @articles.tag_counts.nil?


  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to @article , notice: 'Program was successfully created'
    else
      render 'new'
    end
  end

  def show
    @attachable = @article
    @photos = @attachable.photos
    @commentable = @article
    @comments = @commentable.comments.page(params[:page]).per(10)
    @comment = Comment.new
  end

  def edit

  end

  def update
      if @article.update(article_params)
        redirect_to @article, notice: 'Program was successfully updated.'
      else
        render  'edit'
      end

  end

  def destroy
    @article.destroy
    redirect_to articles_url
  end

private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :image, :remote_image_url,:location, :date, :tag_list)
  end
end
