class ReviewsController < ApplicationController
  before_filter :authenticate_user!

  def index
  @user = User.find(params[:user_id])
  @reviews_recieved = Review.where("reviewable_id" == @user.id)
  end

  def new
    @user = User.find(params[:user_id])
    @review = Review.new
  end

  def create
    @user = User.find(params[:user_id])
    @review = Review.new(review_params)
    @review.reviewable_id = params[:user_id]
    @review.reviewer_id = current_user.id
    if @review.save
      redirect_to @user
      flash[:notice] = "Thank you for submitting your review"
    else
      render 'new'
      flash[:notice] = "Please fill out the rest of the form"
    end
  end


  private

  def review_params
    params.require(:review).permit(:title, :body, :rating, :reviewable_type, :request_id)
  end


end
