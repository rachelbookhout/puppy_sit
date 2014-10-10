class RequestsController < ApplicationController
  before_filter :authenticate_user!, except: [:index,:show]


  def index
    @requests = Request.all
    @geojson = []
    @requests.each do |item|
      @geojson << {
      type: 'Feature',
      geometry: {
      type: 'Point',
      coordinates: [item.longitude, item.latitude]
      },
      properties: {
      name: item.dog_name,
      photo: "#{item.photo}",
      :'marker-color' => '#00607d',
      :'marker-symbol' => 'circle',
      :'marker-size' => 'medium'
      }
    }
  end
  respond_to do |format|
    format.html
    format.json { render json: @geojson }  # respond with the created JSON object
  end
end


  def show
    #button to submit for this request should only show up if they are logged in
    @request = Request.find(params[:id])
    @comment = Comment.new
    @comments = Comment.all.where(request_id:"#{@request.id}")
    @response = Response.new
  end

  def new
  #can only see this page if they are logged in
  @request = Request.new
  end

  def create
  @request = Request.new(request_params)
  @request.requester_id = current_user.id
  if @request.save
    redirect_to @request
    flash[:notice] = "This Request has been created successfully"
  else
    render :new
  end
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



  private

  def request_params
    params.require(:request).permit(:title,:address,:body,:pay,:dog_name,:photo,:start_time, :end_time, :hourly, :weekly, :daily, :longitude, :latitude)
  end
end


