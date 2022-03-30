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

  it ".order_by_most_recent" do
    Player.destroy_all
    Team.destroy_all
    @team_united = Team.create!(name: "United", rank: 5, won_championship: true)
    @team_chelsea = Team.create!(name: "Chelsea", rank: 3, won_championship: true)
    @team_liverpool = Team.create!(name: "Liverpool", rank: 2, won_championship: true)

    expect(Team.order_by_most_recent).to eq([@team_liverpool, @team_chelsea, @team_united])
  end
end
