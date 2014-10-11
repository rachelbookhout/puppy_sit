class Profile::UsersController < ApplicationController
  before_filter :current_profile!

  def show
    @user = current_user
  end

end
