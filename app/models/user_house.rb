class UserHouse < ApplicationRecord
  validates :house_id, presence: true
  has_many :houses
end
