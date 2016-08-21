class UserHouse < ApplicationRecord
  validates :house_id, presence: true
end
