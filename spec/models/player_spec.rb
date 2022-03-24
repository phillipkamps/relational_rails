require "rails_helper"

RSpec.describe Player do
  describe "realtionships" do
    it { should belong_to :team }
  end
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should allow_value(true).for(:injured) }
    it { should allow_value(false).for(:injured) }
  end
end
