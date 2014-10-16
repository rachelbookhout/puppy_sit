class Profile::ResponsesController < ApplicationController
  before_filter :current!

  def index
    @user = current_user
    @responses = @user.responses
  end

  def destroy
  @user = current_user
  @response = Response.find(params[:id])
  NoMoreResponseMailer.no_longer_response(@response.request.requester,@response).deliver
  @response.destroy
  redirect_to profile_user_requests_path(@user)
  end
end
