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

  it ".older_than" do
    Player.destroy_all
    Team.destroy_all
    @team_united = Team.create!(name: "United", rank: 5, won_championship: true)
    @player_pogba = Player.create!(name: "Pogba", age: 29, injured: false, team_id: @team_united.id)
    @player_fernandes = Player.create!(name: "Fernandes", age: 27, injured: false, team_id: @team_united.id)
    @player_ronaldo = Player.create!(name: "Ronaldo", age: 38, injured: false, team_id: @team_united.id)

    expect(Player.older_than(28)).to eq([@player_pogba, @player_ronaldo])
    expect(Player.older_than(30)).to eq([@player_ronaldo])
  end
end
