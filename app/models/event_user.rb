class EventUser < ApplicationRecord
  belongs_to :event
  belongs_to :user

  def self.user_has_event?(current_user, event)
    EventUser.exists?(:event_id => event.id, :user_id => current_user.id)
  end

  def self.user_event_status(event, user)
    EventUser.where(event: event, user: user).first.confirmed
  end

  def self.add_confirmed_class_to_event?(user, event)
    if user_has_event?(user, event)
      user_event_status(event, user)
    else
      false
    end
  end

  #TODO
  def self.is_event_confirmed_by_user(user, event)
    if user_has_event?(user, event)
      user_event_status(event, user)
    else
      false
    end
  end
end
