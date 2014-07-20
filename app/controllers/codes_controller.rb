class CodesController < ApplicationController

  expose(:offer) { Offer.find(params[:offer_id]) }
  expose(:code) { offer.codes.build(code_params) }

  def create
    code.ip = request.remote_ip
    code.code = SecureRandom.hex
    if code.save
      respond_to do |format|
        format.html { redirect_to offer_path(offer), notice: 'Code was successfully generated and sent to your email.' }
      end
    else
      respond_to do |format|
        format.html { render :new }
    end
    end
  end

  private

    def code_params
      params.require(:code).permit(:code, :email)
    end

end
