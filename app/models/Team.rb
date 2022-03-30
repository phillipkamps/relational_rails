class Team < ApplicationRecord
  has_many :players, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :rank
  validates :won_championship, inclusion: [true, false]

  def self.order_by_most_recent
    order(created_at: :desc)
  end
end
