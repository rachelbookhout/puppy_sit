class UsersController < ApplicationController

  def show

  end

  def is_admin?
    role == 'admin'
  end
end
