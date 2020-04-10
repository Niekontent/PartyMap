class Event < ApplicationRecord
  has_one_attached :photo
  self.inheritance_column = nil
end
