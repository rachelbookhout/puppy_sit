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
    @user = User.find(params[:user_id])
    @review = Review.new(review_params)
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
    params.require(:request).permit(:title, :body, :rating)
  end


end
