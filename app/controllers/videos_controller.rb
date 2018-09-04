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
    @videos = Video.all
    create_history_and_increment_score
    @video_categories = VideoCategory.where("video_id = #{@video.id}")
    @comments = Comment.where(video: @video)
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

  def create_history_and_increment_score
    if user_signed_in?
      History.create(video: @video, user: current_user)
      # Iterate through unique super_categories of video
      @video.super_categories.uniq.each do |super_category|
        # Get score that belongs to user for super category
        score = super_category.scores.find_by(user: current_user)
        # Create a score if it doesn't exist for the user
        score = Score.create(super_category: super_category, user: current_user) if score == nil
        # Get current viewed_videos score
        new_score = (score.viewed_videos += 1)
        # Increment viewed_videos score by one
        score.update(viewed_videos: new_score)
      end
    end
  end
end
