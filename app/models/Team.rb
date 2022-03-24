class Team < ApplicationRecord
  has_many :players

  validates_presence_of :name
  validates_presence_of :rank
  validates :won_championship, inclusion: [true, false]
end
