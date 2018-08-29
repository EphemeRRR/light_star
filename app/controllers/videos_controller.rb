class VideosController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_video, only: [:show]

  def index
    # if user_signed_in?
    #   # ... current_user.scores
    # else
      @videos = Video.all
    # end
  end

  def show
    #
  end

  def search
    if params[:query].present?
      @videos = Video.global_search(params[:query])
    else
     flash[:alert] = "Video not existing!! Please search again"
     redirect_to root_path
    end
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end
end
