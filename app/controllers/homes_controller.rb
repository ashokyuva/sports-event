class HomesController < ApplicationController
  before_filter :authenticate_user!
  # GET /homes
  # GET /homes.json
  def index
    @homes = Home.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @homes }
    end
  end

  def all_events
    @event = Ticket.where('user_id = ?',current_user.id)
    p current_user.id
    p @event
  end

  def price_list
  
  end
  
  def payment_complete
    p "payment complete"
    @ticket = Ticket.find(params[:id])
    @at = 1250 if @ticket.is_cricket
    @at = 1150 if @ticket.is_football
    @at = 1050 if @ticket.is_volleyball
    @at = 950 if @ticket.is_tennis
    @at = 1020 if @ticket.is_hockey
    @amount = @at * 58.45
    if current_user.gender == 'male'
      @gen = 0
    elsif current_user.gender == 'female'
      @gen = 5
    end
    @gender = @gen
    @savings = @amount * @gender / 100;
    if @gender == 0
      @total = @amount;
    else
      @total = @amount - @savings;
    end
  end

  def todays_event
    @today = current_user.tickets.where("enddate = ?",Date.today)
  end

  def event_expires
    @expire = current_user.tickets.where("enddate < ?",Date.today)
  end

  # GET /homes/1
  # GET /homes/1.json
  def show
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @home }
    end
  end

  # GET /homes/new
  # GET /homes/new.json
  def new
    @ticket = Ticket.new
    @amt = params[:price]
    @amount = @amt.split(/\W/)[1].to_i
    if params[:gender] == 'male'
      @gen = 0
    elsif params[:gender] == 'female'
      @gen = 5
    end
    @gender = @gen
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @home }
    end
  end

  # GET /homes/1/edit
  def edit
    @ticket = Ticket.find(params[:id])
    
  end

  # POST /homes
  # POST /homes.json
  def create
    @home = Home.new(params[:home])

    respond_to do |format|
      if @home.save
        format.html { redirect_to @home, notice: 'Home was successfully created.' }
        format.json { render json: @home, status: :created, location: @home }
      else
        format.html { render action: "new" }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /homes/1
  # PUT /homes/1.json
  def update
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        format.html { redirect_to @ticket, notice: 'Home was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homes/1
  # DELETE /homes/1.json
  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    @ticket.payment.destroy
    render :json => { success: "deleted" }
  end
end
