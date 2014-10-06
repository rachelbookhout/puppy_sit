class RespondersController < ApplicationController
  before_filter :authenticate_user!

  def new
    @responder = Responder.new
  end

  def create
  @request = Request.find(params[:request_id])
  @responder = Responder.new
  @responder.responder_id = current_user.id
  @responder.request_id = @request.id
  @responder.chosen = true
  if @responder.save
    redirect_to root_path
    flash[:notice] = "Thank you for your help. Please look at your email to learn about the next steps"
  else
    redirect_to @request
    flash[:notice] = "There has been an error with your request. Please try again"
  end
  end

end
