class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    @reviews = Review.where(reviewable_id: @user.id)
  end
end
