class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name,:last_name,:profile_photo]
  end

  def authorize!
    if current_user.nil? or !current_user.is_admin?
      flash[:notice] = "You are not authorized to view this resource."
      redirect_to root_path
    end
  end

  def current_profile!
    @user = User.find(params[:id])
    if current_user.id != @user.id
      flash[:notice] = "You are not authorized to view this page"
      redirect_to root_path
    end
  end


 def current!
    binding.pry
    @user = User.find(params[:user_id])
    if current_user.id != @user.id
      flash[:notice] = "You are not authorized to view this page"
      redirect_to root_path
    end
  end
end




