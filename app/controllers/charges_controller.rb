class ChargesController < ApplicationController
  before_action :set_charge
  before_action :authenticate_user!

  def show
    respond_to do |format|
      format.pdf{ 
                 send_data(@charge.receipt.render, 
                 filename: "Your Receipt.pdf",
                 type: "application/pdf",
                 disposition: :inline
                 )
                }
    end
  end

  private
    def set_charge
      @charge = Charge.find(params[:id])
    end

end