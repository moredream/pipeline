class WelcomeController < ApplicationController

  respond_to :html, :json

  def index
    respond_with(labs)
  end


private
  def labs
    @labs ||= Lab.order(:name)
  end

end
