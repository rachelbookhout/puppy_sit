class Profile::ReviewsController < ApplicationController
    before_filter :current!

  def index
  @user = User.find(params[:user_id])
  # @reviews_given = Review.where("reviewer_id" == @user.id)
  @requesters = User.user_reviews_requester(@user)
  @responders = User.user_reviews_responder(@user)
  end
end
