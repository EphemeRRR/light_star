class VideosController < ApplicationController
  before_action :set_video

  def index
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
