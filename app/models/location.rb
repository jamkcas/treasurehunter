class Location < ActiveRecord::Base
  attr_accessible :lat, :long, :name

  has_many :clues
  has_many :hunt_locations
  has_many :hunts, through: :hunt_locations

  validates :lat, presence: true
  validates :long, presence: true
  validates :name, presence: true, uniqueness: true
end
