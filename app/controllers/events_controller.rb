class EventsController < ApplicationController

  before_action :set_event, only: %i(show edit update destroy)
  before_action only: [:index] do
    get_search_query('query_interventions')
  end

  def index
    @q = Event.search(@query) #TODO first active then search
    @events = @q.result(distinct: true).where("date > ?", Time.current).order(created_at: :desc)
  end

  def show

  end

  def edit

  end

  def update
    if @event.update(event_params)
      redirect_to events_path, flash: { info: 'Event was updated successfully!' }
    else
      render :edit
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.owner = current_user
    if @event.save
      redirect_to events_path, flash: { info: 'You created the event successfully!' }
    else
      render :new
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, flash: { info: 'Event was destroyed successfully!' }
  end

  private

  def event_params
    params.require(:event).permit(:title, :type, :description, :date, :location, :photo)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  #TODO move this logic to localstorage and JS
  def get_search_query(cookie_key)
    cookies.delete(cookie_key) if params[:clear]
    cookies[cookie_key] = params[:q].to_json if params[:q]
    @query = params[:q].presence || JSON.load(cookies[cookie_key])
  end
end