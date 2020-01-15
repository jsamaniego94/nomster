class Place < ApplicationRecord
  belongs_to :user
  mas_many :comments
  geocoded_by :address
  after_validation :geocode
  validates :name, presence: true
  validates :name, length: {minimum: 3}, presence: true
  validates :address, presence: true
  validates :description, presence: true
 
end 