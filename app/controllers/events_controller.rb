class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_organization

  # GET /events
  # GET /events.json
  def index
    @events = @organization.events.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @products = @event.products
  end

  # GET /events/new
  def new
    @event = @organization.events.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

      if @event.save
        redirect_to organization_path(@event.organization), notice: 'Event was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    if @event.update(event_params)
      redirect_to organization_path(@event.organization), notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    redirect_to organization_url(@organization), notice: 'Event was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def set_organization
      @organization = current_user.organizations.where(id: params[:organization_id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:start_at, :end_at, :name, :organization_id)
    end
end
