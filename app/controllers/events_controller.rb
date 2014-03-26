class EventsController < ApplicationController

	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	before_action :set_event, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

	def index


	end

	def search

	end

	def new
	@event = Event.new
	end

	def create
	@event = current_user.articles.build(event_params)
	if @event.save
	  redirect_to @event , notice: 'Program was successfully created'
	else
	  render 'new'
	end
	end

	def show
	@commentable = @event
	@comment = Comment.new
	@attachable = @event
	@photos = @attachable.photos
	@voter = current_user

	end

	def edit

	end

	def update
	  if @event.update(event_params)
	    redirect_to @event, notice: 'Program was successfully updated.'
	  else
	    render  'edit'
	  end
	end

	def destroy
	@event.destroy
	redirect_to articles_url
	end

	def upvote
	respond_to do |format|
	  if @event.liked_by current_user
	    format.html { redirect_to @event, notice: "Thanks for vote!" }
	    format.js
	  else
	    render @event
	  end
	end
	end

	def downvote
	respond_to do |format|
	  if  @event.downvote_from current_user
	    format.html { redirect_to @event, notice: "Thanks for vote!" }
	    format.js
	  else
	    render @event
	  end
	end
	end

	private

	def set_event
		@event = Event.find(params[:id])
	end

	def event_params
		params.require(:event).permit(:title, :content,  :tag_list=>[])
	end

	def offers
		@offers ||= Event.offers
	end

	helper_method :offers


	def events
	if params[:tag]
	  @events = Event.tagged_with(params[:tag]).page(params[:page]).per(2)
	elsif params[:q] || params[:tag_id]
	  @events ||= Event.search_tags(params[:q], params[:tag_id]).page(params[:page]).per(2)
	else
	  @events ||= Event.trends('100').page(params[:page]).per(2)
	end

	end

	helper_method :events
end
