class VideosController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_video

  def index
    if user_signed_in?
      #
    else
      @videos = Video.all
    end
  end

  def show
    #
  end

  def search
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end
end
