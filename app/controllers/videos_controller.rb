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
    if user_signed_in?
      History.create(video: @video, user: current_user)
      @video.super_categories.each do |super_category|
        score = super_category.scores.find_by(user: current_user)
        score.viewed_videos += 1
        raise
        # score = sub_category.super_category.scores.find_by(user: current_user)
        # score.viewed_videos += 1;
      end
    end
  end

  def search
    if params[:query].present?
      @videos = Video.global_search(params[:query])
    else
     flash[:alert] = "Video does not exist!! Please search again."
     redirect_to root_path
    end
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end
end
