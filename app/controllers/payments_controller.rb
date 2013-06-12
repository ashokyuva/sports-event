class PaymentsController < ApplicationController
  before_filter :authenticate_user!

  def new
    p "new action"
    @payment = Payment.new
    render :json => { success: @payment }
  end
  
  def create
    p "create action"
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
