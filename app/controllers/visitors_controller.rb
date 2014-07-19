class VisitorsController < ApplicationController
  
  expose(:offers_active) { offers.active }
  expose(:offers_pending) { offers.pending }
  expose(:offer) { Offer.find(params[:id]) }
  expose(:offers) { Offer.all }

  def index
  end

  def show
  end
end
