class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index

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
    params.require(:article).permit(:title, :content, :image,:tag_ids=>[])
  end


  def tags
    @tags ||= Tag.order(:name)
  end

  helper_method :tags

  def articles
    if params[:tag]
      @articles ||=  Article.tagged_with(params[:tag])
    else
      @articles ||=  Article.trends('')
    end
  end

  helper_method :articles
end
