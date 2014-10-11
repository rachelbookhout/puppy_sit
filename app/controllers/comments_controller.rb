class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @request = Request.find(params[:request_id])
    @comments = Comment.all.where(request_id:"#{@request.id}")
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.request_id = @request.id
    if @comment.save
      redirect_to @request
      flash[:notice] = "Your comment has been added"
    else
      redirect_to @request
      flash[:notice] = "Please input something into your comment"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
