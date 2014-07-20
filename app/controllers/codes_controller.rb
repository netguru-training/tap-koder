class CodesController < ApplicationController

  expose(:offer) { Offer.find(params[:offer_id]) }
  expose(:code) { offer.codes.build(code_params) }

  def create
    # add ip save
    if code.save
      # add proper redirects and stuff
      format.html { redirect_to offer, notice: 'Code was successfully generated and sent to your email.' }
    else
      format.html { render :new }
    end
  end

  private

    def code_params
      params.require(:code).permit(:code, :email)
    end

end
