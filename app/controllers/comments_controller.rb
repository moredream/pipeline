class CommentsController < ApplicationController
  before_action :load_commentable, :authenticate_user!
  before_action :set_comment, only: [:destroy]

  def index
    @comments = @commentable.comments.available.page(params[:page]).per(10)
  end

  def new
    @comment = @commentable.comments.new

  end

  def create
    @comment = @commentable.comments.new(comment_params)

    @comment.user_id = current_user.id

    if @comment.save
      redirect_to @commentable, notice: "Comment created."
    else
      render :new
    end
  end

  def destroy
    @comment.destroy
    redirect_to @commentable
  end


private

  def load_commentable
    klass = [Article, Program].detect { |c| params["#{c.name.underscore}_id"]}
    @commentable = klass.find(params["#{klass.name.underscore}_id"])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end

end
