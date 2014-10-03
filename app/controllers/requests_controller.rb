class RequestsController < ApplicationController

  def index
  end

  def show
  end

  def new
  #can only see this page if they are logged in
  @request = Request.new
  end

  def create
  #set requester_id
  @request = Request.new(request_params)
  if @request.save
    redirect_to @request
  else
    render :new
  end
  end

  def edit
  end

  def delete
  end

  private

  def request_params
    params.require(:request).permit(:title,:address,:body,:pay,:dog_name,:photo,:start_time, :end_time)
  end
end


