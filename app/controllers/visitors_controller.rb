class VisitorsController < ApplicationController
  
  expose(:offers_active) { offers.active }
  expose(:offers_pending) { offers.pending }
  expose(:offer) { Offer.find(params[:id]) }
  expose(:offers) { Offer.all }

  def index
    gon.url = url_for root_path
    gon.interval = true
    gon.array = true

    respond_to do |format|
      format.html { render :index }
      format.json { render :index, layout: nil }
    end    
  end

  def show
  end
end
