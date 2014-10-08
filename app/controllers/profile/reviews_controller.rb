class Profile::ReviewsController < ApplicationController

  def index
  @user = User.find(params[:user_id])
  # @reviews_given = Review.where("reviewer_id" == @user.id)
  @requesters = User.user_reviews_requester(@user)
  @responders = User.user_reviews_responder(@user)
  end

  def new
    @user = User.find(params[:user_id])
    @review = Review.new
  end

  def create
    binding.pry
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

  def edit
    ##Are these reviews written by the user
  @review = Review.find(params[:id])
  end

  def update
    ## Are these reviews written by the user?
    #@user = User.find(params[:user_id])
    @review = Review.find(params[:id])
    @review.reviewable_id = params[:user_id]
    @review.reviewer_id = current_user.id
    if @review.update(review_params)
      redirect_to profile_user_reviews_path(@user.id)
      flash[:notice] = "Thank you for the updated review"
    else
      render 'edit'
      flash[:notice] = "Please fill out the rest of the form"
    end
  end

  def destroy
    #is this reviews that the current user wrote
  @user = current_user
  @review = Review.find(params[:id])
  @review.destroy
  redirect_to profile_user_reviews_path(@user.id)
  end



 private

  def review_params
    params.require(:review).permit(:title, :body, :rating, :reviewable_type, :request_id)
  end
end
