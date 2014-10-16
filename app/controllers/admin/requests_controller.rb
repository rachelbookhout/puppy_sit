class Admin::RequestsController < ApplicationController
  before_filter :authorize!

  def index
    @requests = Request.all
  end
end
