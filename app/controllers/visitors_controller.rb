class VisitorsController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @offers = Offer.order("created_at DESC") # probbaly newest on top ;)
  end

  def show
    @offer = Offer.find(params[:id])
  end
end