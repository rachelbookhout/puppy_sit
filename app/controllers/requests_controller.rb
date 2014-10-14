class RequestsController < ApplicationController
  before_filter :authenticate_user!, except: [:index,:show]


  def index
    all_requests = Request.all
    @requests = []
    all_requests.each do |request|
      if request.responses == [] || request.responses[0].chosen == false
        if request.end_time > Time.now
          @requests << request
        end
      end
    end
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
      num: item.id,
      start_time: item.start_time.to_s(:times),
      end_time: item.end_time.to_s(:times),
      :'marker-color' => '#00607d',
      :'marker-symbol' => 'circle',
      :'marker-size' => 'medium'
      }
    }
    end
    respond_to do |format|
      format.html
      format.json { render json: @geojson }
    end
  end


  def show
    @request = Request.find(params[:id])
    @comment = Comment.new
    @comments = Comment.all.where(request_id:"#{@request.id}")
    @response = Response.new
  end

  def new
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

  def destroy
    @request = Request.find(params[:id])
    if current_user.is_admin?
      @request.destroy
      redirect_to requests_url
      flash[:notice] = "This request has been successfully destroyed"
    end
  end

  private

  def request_params
    params.require(:request).permit(:title,:address,:body,:pay,:dog_name,:photo,:start_time, :end_time, :hourly, :weekly, :daily, :longitude, :latitude)
  end
end


