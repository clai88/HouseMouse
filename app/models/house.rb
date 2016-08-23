class House < ApplicationRecord
  validates :street_address, presence: true, uniqueness: { scope: :zip }
  validates :zip, presence: true, numericality: true

  has_many :user_houses

  def street_address=(string)
    super(string.downcase.strip)
  end
end
