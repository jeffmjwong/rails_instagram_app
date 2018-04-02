class CommentsController < ApplicationController
  before_action :set_instapost


  def create
    @comment = @instapost.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to @instapost
  end




  private

    def set_instapost
      @instapost = Instapost.find(params[:instapost_id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
