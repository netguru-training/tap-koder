class OffersController < ApplicationController
  before_filter :authenticate_user!, except: [:show]

  expose(:offer) { Offer.find(params[:id]) }
  expose(:offers) { Offer.all }


  # GET /offers
  # GET /offers.json
  def index
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
    if user_signed_in?
      render :show
    else
      render :limited
    end
  end

  # GET /offers/new
  def new
    self.offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  # POST /offers.json
  def create
    
    self.offer = Offer.new(offer_params)
    self.offer.user = current_user
    respond_to do |format|
      if offer.save
        format.html { redirect_to offer, notice: 'Offer was successfully created.' }
        format.json { render :show, status: :created, location: offer }
      else
        format.html { render :new }
        format.json { render json: offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if self.offer.update(offer_params)
        format.html { redirect_to offer, notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: offer }
      else
        format.html { render :edit }
        format.json { render json: offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    self.offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:name, :description, :user_id, :code_limit, :start_date)
    end
end
