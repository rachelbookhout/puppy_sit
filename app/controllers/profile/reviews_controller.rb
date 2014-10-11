class Profile::ReviewsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @requesters = User.user_reviews_requester(@user)
    @responders = User.user_reviews_responder(@user)
  end

  def new
    @user = User.find(params[:user_id])
    @review = Review.new
  end

  def myreviews
    @user = User.find(params[:user_id])
    @reviews = Review.where("reviewer_id" == @user.id)
  end

  def edit
    @user = User.find(params[:user_id])
    @review = Review.find(params[:id])
  end


  def destroy
    @user = current_user
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to profile_user_path(@user.id)
  end



 private

  def review_params
    params.require(:review).permit(:title, :body, :rating, :reviewable_type, :request_id)
  end
end
