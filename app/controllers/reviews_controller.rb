class ReviewsController < ApplicationController
  before_filter :authenticate_user!

  def index
  @user = User.find(params[:user_id])
  @reviews_recieved = Review.where("reviewable_id" == @user.id)
  end


end
