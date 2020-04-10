class User < ApplicationRecord
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  #TODO https://guides.rubyonrails.org/association_basics.html#the-has-and-belongs-to-many-association
  has_many :event_users
  has_many :events, through: :event_users
  has_many :owned_events, class_name: 'Event', foreign_key: 'owner_id', dependent: :destroy


  #def user_event_status(event)
  #  EventUser.where(event: event, user: self).first.confirmed
  #end
  #TODO: Myśle że to nie powinno byc tutaj
end
