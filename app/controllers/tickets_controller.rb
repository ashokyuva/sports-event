class TicketsController < ApplicationController
  before_filter :authenticate_user!

  def new
    #if Ticket.all.collect(&:user_id).include? current_user.id
      #p "update"
      #@ticket = Ticket.find_by_user_id(current_user.id)
      #@ticket.update_attributes(params[:ticket])
      #@success = "Updated Successfully"
    #else
      @ticket = Ticket.new(params[:ticket])
      @ticket.save
      @success = "Added Successfully"
    #end
    render :json => { success: @ticket.id , status: @success}
  end 

end
