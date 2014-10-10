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
      update_review_score(@user, @review)
      NewReviewMailer.new_review(@review.reviewable).deliver
      redirect_to user_path(@user.id)
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
      update_review_score(@user, @review)
      redirect_to profile_user_path(@user.id)
      flash[:notice] = "Thank you for the updated review"
    else
      render 'profile/reviews/edit'
      flash[:notice] = "Please fill out the entire form correctly"
    end
  end

   def calc_responder_review(user)
    responder_reviews = Review.where(reviewable_id:user.id, reviewable_type:"responder")
    response_rating = 0
    responder_reviews.each do |review|
      response_rating += review.rating
    end
    @response_rating = response_rating/responder_reviews.length
  end

  def calc_requester_review(user)
    requester_reviews = Review.where(reviewable_id:user.id, reviewable_type:"requester")
    requester_rating = 0
    requester_reviews.each do |review|
    requester_rating  += review.rating
    end
    @requester_rating = requester_rating/requester_reviews.length
  end

  def update_review_score(user,review)
    if review.reviewable_type == "responder"
      calc_responder_review(user)
      user.responder_rating = @response_rating
      binding.pry
      @user.save
    else
    calc_requester_review(user)
    user.requester_rating = @requester_rating
    @user.save
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
