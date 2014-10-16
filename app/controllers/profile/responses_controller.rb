class Profile::ResponsesController < ApplicationController
  before_filter :current!

  def index
    @user = current_user
    @responses = @user.responses
     @responses_json = []
    @responses.each do |item|
      @responses_json << {
        dog: item.request.dog_name,
        address: item.request.address,
        start: item.request.start_time,
        end: item.request.end_time
      }
      end
    respond_to do |format|
      format.html
      format.json { render json: @responses_json}
    end
  end

  def destroy
  @user = current_user
  @response = Response.find(params[:id])
  NoMoreResponseMailer.no_longer_response(@response.request.requester,@response).deliver
  @response.destroy
  redirect_to profile_user_requests_path(@user)
  end
end
