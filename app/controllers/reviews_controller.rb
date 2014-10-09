class ReviewsController < ApplicationController
  before_filter :authenticate_user!

  def index
  @user = User.find(params[:user_id])
  @reviews_recieved = Review.where("reviewable_id" == @user.id)
  end

  def create
    @user = User.find(params[:user_id])
    @review = Review.new(review_params)
    @review.reviewable_id = params[:user_id]
    @review.reviewer_id = current_user.id
    if @review.save
      NewReviewMailer.new_review(@review.reviewable).deliver
      redirect_to user_reviews_path(@user.id)
      flash[:notice] = "Thank you for submitting your review"
    else
      render 'new'
      flash[:notice] = "Please fill out the rest of the form"
    end
  end

    def update
    @user = User.find(params[:user_id])
    @review = Review.find(params[:id])
    @review.reviewable_id = params[:user_id]
    @review.reviewer_id = current_user.id
    if @review.update(update_review_params)
      redirect_to profile_user_path(@user.id)
      flash[:notice] = "Thank you for the updated review"
    else
      render 'profile/reviews/edit'
      flash[:notice] = "Please fill out the entire form correctly"
    end
  end


 private

  def review_params
    params.require(:review).permit(:title, :body, :rating, :reviewable_type, :request_id)
  end

   def update_review_params
    params.require(:review).permit(:title, :body, :rating)
  end
end
