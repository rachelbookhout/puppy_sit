class UsersController < ApplicationController

  def show
  @user = User.find(params[:id])
  @requesters = User.user_reviews_requester(@user)
  @responders = User.user_reviews_responder(@user)
  end

end
