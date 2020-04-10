class User::EventsController < ApplicationController
  def index
    @owned_events = current_user.owned_events
    @assigned_events = current_user.events
  end

  def show

  end

  def new
    current_user.events << Event.find(params[:id])
    redirect_to events_path
  end

  def participants #TODO participants controller
    @event = Event.find(params[:id])
    @event_participants = @event.users
  end

  def update_status
    EventUser.where(event_id: params[:id], user_id: params[:user_id]).update(confirmed: params[:status])
    redirect_to user_event_participants_path(params[:id]), flash: { info: 'Status użytkownika został zmieniony!' }
  end

  def sign_out
    EventUser.where(event_id: params[:id], user_id: current_user.id).first.destroy
    redirect_to user_events_path, flash: { info: 'Zrezygnowano z tego Eventu!' }
  end
end