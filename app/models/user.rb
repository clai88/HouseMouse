class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_houses
  has_many :houses, through: :user_houses
  # 
  # def user_houses
  #   UserHouse.where(user_id: self.id)
  # end
  #
  # def houses
  #   House.where(id: user_houses.pluck(:house_id))
  # end
end
