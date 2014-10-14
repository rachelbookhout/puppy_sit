class Admin::RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

end
