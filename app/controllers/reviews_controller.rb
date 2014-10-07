class ReviewsController < ApplicationController
  before_filter :authenticate_user!

  def index
  @reviews = Reviews.all
  #   @reviewable = find_reviewable
  #   @reviews = @reviewable.all
  end

  def show
    @review = Review.find(params[:id])
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
    else
      render 'new'
    end
  end

  # def find_reviewable
  #   params.each do |name, value|
  #     if name =~ /(.+)_id$/
  #       return $1.classify.constantize.find(value)
  #     end
  #   end
  #   nil
  # end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating, :reviewable_type, :request_id)
  end


end
