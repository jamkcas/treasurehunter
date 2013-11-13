class Hunt < ActiveRecord::Base
  attr_accessible :description, :title, :prize, :date, :start_location

  has_many :locations
  has_many :hunt_locations
  has_many :clues, through: :locations # Is this needed?

  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :start_location, presence: true
end