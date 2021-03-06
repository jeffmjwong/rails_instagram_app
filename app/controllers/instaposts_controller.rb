class InstapostsController < ApplicationController
  before_action :set_instapost, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]

  def index
    @instaposts = Instapost.all
  end

  def show
  end

  def new
    @instapost = Instapost.new
  end

  def edit
  end

  def create
    @instapost = Instapost.new(instapost_params)
    @instapost.user = current_user

    respond_to do |format|
      if @instapost.save
        format.html { redirect_to @instapost, notice: 'Instapost was successfully created.' }
        format.json { render :show, status: :created, location: @instapost }
      else
        format.html { render :new }
        format.json { render json: @instapost.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @instapost.update(instapost_params)
        format.html { redirect_to @instapost, notice: 'Instapost was successfully updated.' }
        format.json { render :show, status: :ok, location: @instapost }
      else
        format.html { render :edit }
        format.json { render json: @instapost.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @instapost.destroy
    respond_to do |format|
      format.html { redirect_to instaposts_url, notice: 'Instapost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instapost
      @instapost = Instapost.find(params[:id])
    end

    def check_owner
      if @instapost.user != current_user
        redirect_to(instaposts_url, notice: "You cannot perform that action!")
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instapost_params
      params.require(:instapost).permit(:caption, :user_id, :photo)
    end
end
