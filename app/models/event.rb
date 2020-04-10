class Event < ApplicationRecord
  has_one_attached :photo
  self.inheritance_column = nil

  #TODO check enum docs to DIY
  enum type: { papieros: 'papieros',
               planszówki: 'planszówki',
               domówka: 'domówka',
               seans: 'seans',
               gotowanie: 'gotowanie',
               inne: 'inne' }

  has_many :event_users, dependent: :destroy
  has_many :users, through: :event_users
  belongs_to :owner, class_name: 'User'

  def self.belongs_to_current_user?(current_user, event)
    event.owner == current_user
  end

  def self.return_event_photo(id)
    find(id).photo
  end

end
