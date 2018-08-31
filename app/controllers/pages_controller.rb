class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # @array = []
    # videos = Video.all
    # videos.each do |video|
    #   vid =  Yt::Video.new id:  "#{video.youtube_id}"

    #   @array << vid
    # end
  end
end
