require "rails_helper"

RSpec.describe Team do
  describe "realtionships" do
    it { should have_many :players }
  end
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :rank }
    it { should allow_value(true).for(:won_championship) }
    it { should allow_value(false).for(:won_championship) }
  end
end
