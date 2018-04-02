class CommentsController < ApplicationController
  before_action :set_instapost
  before_action :set_comment, except: [:create]
  before_action :check_owner, except: [:create]

  def edit
  end

  def create
    @comment = @instapost.comments.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @instapost, notice: 'Comment added.' }
        format.json { render :show, status: :created, location: @instapost }
      else
        format.html { redirect_to @instapost, notice: 'Comment cannot be empty.' }
        format.json { render json: @instapost.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @instapost, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @instapost }
      else
        format.html { redirect_to edit_instapost_comment_path, notice: 'Comment cannot be empty.' }
        format.json { render json: @instapost.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @instapost, notice: 'Comment was removed.' }
      format.json { head :no_content }
    end
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
