class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
    @instapost = Instapost.find(params[:id])
  end

  # GET /comments/1/edit
  def edit
    @instapost = @comment.instapost
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @instapost = Instapost.find(comment_params[:instapost_id])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to instapost_path({ id: comment_params[:instapost_id] }), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
       format.html { render :new }
       format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @instapost = Instapost.find(comment_params[:instapost_id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to instapost_path({ id: comment_params[:instapost_id] }), notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @instapost = @comment.instapost
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @instapost, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def check_owner
      if @comment.user != current_user
        redirect_to(instaposts_url, notice: "You cannot perform that action!")
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :user_id, :instapost_id)
    end
end
