class PaymentsController < ApplicationController
  before_filter :authenticate_user!
  
  
  def create
    @payment = Payment.new(params[:payment])
      if @payment.save
        @tic = params[:payment][:ticket_id]
        @ticket = Ticket.find(@tic)
        @ticket.is_payment = true
        @ticket.save
        @success = "Payment Completed Successfully"
      else
        @success = "Error in payment"
      end
    render :json => { success: @success }
  end
  
end