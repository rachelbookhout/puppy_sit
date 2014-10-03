class CommentsController < ApplicationController

  def new
    @request = Request.find(params[:request_id])
    @comment = Comment.new(comment_params)
  end

  def create
    @request = Request.find(params[:request_id])
    @comment = Comment.new(comment_params)
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
