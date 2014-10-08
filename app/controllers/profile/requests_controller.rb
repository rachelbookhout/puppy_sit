class Profile::RequestsController < ApplicationController
    before_filter :current!

  def index
  @user = current_user
  @requests = Request.where(requester_id == @user.id)
  end
end
