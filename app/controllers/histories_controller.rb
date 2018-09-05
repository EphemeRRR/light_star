class HistoriesController < ApplicationController

  def edit
  end

  def update
    @history = History.find(params["history"]["id"])
    @history.note = params["history"]["note"]
    @history.save


    respond_to do |format|
        format.html { redirect_to video_path(@history.video) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
  end
end
