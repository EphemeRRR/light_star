class VideosController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_video, only: [:show]

  def index
    if user_signed_in?
    #   # ... current_user.scores
    # else
      # @videos = Video.all
      best_scores = current_user.skill_scores.order(skill_score: :DESC).first(2)
      @videos = []
      best_scores.each do |score|
        if score.sub_category.videos.exists?
          @videos << score.sub_category.videos.first(4) # videos
        end
      end
      # Flatten and uniq if array not empty
      if @videos.any?
        @videos.flatten!.uniq!
      else
        @videos = []
      end

    end

      # @videos = videos.
      # @videos = Video.find()
      # current_user.sub_categories.each do |subcategory|
      #   @recommended_videos = subcategory.skill_scores.order_by{ |score| score.skill_scores}
      # end
      # raise
      @sub_categories = SubCategory.all
    # end
  end

  def show
    @videos = Video.all
    @history = get_or_create_history
    @video_categories = VideoCategory.where("video_id = #{@video.id}")
    @comments = Comment.where(video: @video)
    increment_skill_score if user_signed_in?
    # increment_interest_score if user_signed_in?
  end

  def search
    if params[:query].present?
      @videos = Video.global_search(params[:query])
    else
     flash[:alert] = "Nous mettons nos catégories à jour, merci de réessayer ta recherche plus tard."
     redirect_to root_path
    end
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

  def get_or_create_history
    if user_signed_in?
      history = History.find_by(user: current_user, video: @video)
      if history == nil
        History.create(video: @video, user: current_user)
      else
        history.touch
        history
      end
    end
  end

  def increment_interest_score
    # Iterate through unique super_categories of video
    @video.super_categories.uniq.each do |super_category|
      # Get score that belongs to user for super category
      score = super_category.scores.find_by(user: current_user)

      # ====================================================
      # Must create interest scores automatically on sign_up
      # ====================================================

      # Get current viewed_videos score
      new_viewed_videos_score = (score.viewed_videos += 1)
      # Get current interest score
      new_interest_score = (score.interest_score += 1)
      # Increment viewed_videos or interest score score by one
      score.update(viewed_videos: new_viewed_videos_score, interest_score: new_interest_score)
    end
  end

  def increment_skill_score
    # Iterate through unique super_categories of video
    @video.sub_categories.uniq.each do |sub_category|
      # Get score that belongs to user for sub category
      score = sub_category.skill_scores.find_by(user: current_user)
      # Get current viewed_videos score
      new_viewed_videos_score = (score.viewed_videos += 1)
      # Get current skill score
      new_skill_score = (score.skill_score += 1)
      # Increment viewed_videos or skill score score by one
      score.update(viewed_videos: new_viewed_videos_score, skill_score: new_skill_score)
    end
  end
end
