class RequestsController < ApplicationController

  def index
    @requests = Request.all
  end

  def show
    #button to submit for this request should only show up if they are logged in
    @request = Request.find(params[:id])
    @comment = Comment.new
  end

  def new
  #can only see this page if they are logged in
  @request = Request.new
  end

  def create
  @request = Request.new(request_params)
  @request.requester_id = current_user.id
  binding.pry
  if @request.save
    redirect_to @request
  else
    render :new
  end
  binding.pry
  end

  # def edit
  #   #can only edit if user created this request
  #   @request = Request.where(user: current_user).find(params[:id])
  # end

  # def update
  #   @request = Request.find(params[:id])
  #   if @request.update(request_params)
  #     redirect_to @request
  #   else
  #     render 'edit'
  #   end
  # end

  # def destroy
  # #can only delete if user created this request
  #   @request = Request.where(user: current_user).find(params[:id])
  #   @request.destroy
  #   redirect_to requests_path
  # end

  private

  def request_params
    params.require(:request).permit(:title,:address,:body,:pay,:dog_name,:photo,:start_time, :end_time)
  end
end


