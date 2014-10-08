class UsersController < ApplicationController

  def show
  @user = User.find(params[:id])
  @reviews_recieved = Review.where("reviewable_id" == @user.id)
  @reviews_given = Review.where("reviewer_id" == @user.id)
  @requesters = User.user_reviews_requester(@user)
  @responders = User.user_reviews_responder(@user)
  end

end
