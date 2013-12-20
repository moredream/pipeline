class WelcomeController < ApplicationController

  def index
    @micropost = current_user.microposts.build if user_signed_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
  end
end
