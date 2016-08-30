class House < ApplicationRecord
  validates :street_address, presence: true, uniqueness: { scope: :zip }
  validates :zip, presence: true, numericality: true
  validates_presence_of :zip

  def street_address=(string)
    super(string.downcase.strip)
  end
end
