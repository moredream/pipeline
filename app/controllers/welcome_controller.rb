class WelcomeController < ApplicationController

  respond_to :html, :json

  def index
    @labs ||=  Lab.trending
    respond_with(@labs)
  end



end
