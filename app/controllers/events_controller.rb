class EventsController < ApplicationController

  before_action :set_event, only: %i(edit update destroy)
  def index
    @events = Event.all
  end

  def edit

  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
  end

  def destroy
    @event.destroy
  end

  private

  def event_params
    params.require(:event).permit(:title, :type, :description, :date, :location, :picture_url, :photo)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end