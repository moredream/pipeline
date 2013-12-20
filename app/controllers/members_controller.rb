class MembersController < ApplicationController
  def index
    @members = User.all
  end

  def show
      @member = User.find(params[:id])
      @microposts = @member.microposts.paginate(page: params[:page])
  end

end
