class Profile::UsersController < ApplicationController
    before_filter :current!

  def show
    @user = current_user
  end
end
