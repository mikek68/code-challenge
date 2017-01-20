class HotelsController < ApplicationController

  def available_rooms
    respond_to do |format|
      format.json { render json: Hotel.find(params[:id]).available_rooms(params[:start_date], params[:end_date]) }
    end
  end
end
