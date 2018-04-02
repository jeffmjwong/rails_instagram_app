class CommentsController < ApplicationController
  before_action :set_instapost
  before_action :set_comment, except: [:create]
  before_action :check_owner, except: [:create]

  def create
    @comment = @instapost.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to @instapost
  end

  def edit

  end

  def update
    @comment.update(comment_params)
    redirect_to @instapost
  end

  def destroy
    @comment.destroy
    redirect_to @instapost
  end


  private

    def set_instapost
      @instapost = Instapost.find(params[:instapost_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def check_owner
      if @comment.user != current_user
        redirect_to @instapost, notice: 'You are not permitted to perform that action!'
      end
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
