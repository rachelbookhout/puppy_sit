class Profile::RequestsController < ApplicationController
    before_filter :current!

  def index
  @user = current_user
  @requests = @user.requests
  end

  def edit
    @user = current_user
   @request = Request.find(params[:id])
  end

  def update
  @user = current_user
  @request = Request.find(params[:id])
   if @request.update(request_params)
    redirect_to profile_user_requests_path(@user.id)
   else
    render 'edit'
   end
  end

  def delete
  @user = current_user
  @request = Request.find(params[:id])
  @request.destroy
  redirect_to profile_user_requests_path(@user.id)
  end

  def request_params
    params.require(:request).permit(:title,:address,:body,:pay,:dog_name,:photo,:start_time, :end_time, :hourly, :weekly, :daily)
  end
end
