class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @reviews = Review.where(reviewable_id: @user.id)
  end

  def is_admin?
    role == 'admin'
  end
end
