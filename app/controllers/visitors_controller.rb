class VisitorsController < ApplicationController
  skip_before_filter :authenticate_user!
  expose(:offer) { Offer.find(params[:id]) }
  expose(:offers) { Offer.order("created_at DESC") }

  def index
  end

  def show
  end
end
