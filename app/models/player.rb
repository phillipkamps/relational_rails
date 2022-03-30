class Player < ApplicationRecord
  belongs_to :team
  validates_presence_of :name
  validates_presence_of :age
  validates :injured, inclusion: [true, false]

  def self.older_than(num)
    where("age > ?", num)
  end
end
