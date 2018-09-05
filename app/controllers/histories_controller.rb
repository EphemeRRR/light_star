class HistoriesController < ApplicationController

  def edit
  end

  def update
    @history = History.find(params["history"]["id"])
    @history.note = params["history"]["note"]
    @history.save
    redirect_to video_path(@history.video)
  end
end
