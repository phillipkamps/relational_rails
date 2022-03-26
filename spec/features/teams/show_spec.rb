require "rails_helper"

RSpec.describe "Teams Show", type: :feature do
  describe "#show" do
    it "returns parent by id w/ attributes" do
      team_united = Team.create!(name: "United", rank: 5, won_championship: true)

      visit "/teams/#{team_united.id}"
      expect(page).to have_content(team_united.name)
      expect(page).to have_content(team_united.rank)
      expect(page).to have_content(team_united.won_championship)
    end

    it "displays count of players on team" do
      team_united = Team.create!(name: "United", rank: 5, won_championship: true)
      player_pogba = Player.create!(name: "Pogba", age: 28, injured: false, team_id: team_united.id)
      player_fernandes = Player.create!(name: "Fernandes", age: 27, injured: false, team_id: team_united.id)

      visit "/teams/#{team_united.id}"
      expect(page).to have_content("Player Count: 2")
    end

    it "has link to teams index" do
      team_united = Team.create!(name: "United", rank: 5, won_championship: true)
      player_pogba = Player.create!(name: "Pogba", age: 28, injured: false, team_id: team_united.id)
      player_fernandes = Player.create!(name: "Fernandes", age: 27, injured: false, team_id: team_united.id)

      visit "/teams/#{team_united.id}"
      expect(page).to have_link("Teams Index")
    end

    it "has link to players index" do
      team_united = Team.create!(name: "United", rank: 5, won_championship: true)
      player_pogba = Player.create!(name: "Pogba", age: 28, injured: false, team_id: team_united.id)
      player_fernandes = Player.create!(name: "Fernandes", age: 27, injured: false, team_id: team_united.id)

      visit "/teams/#{team_united.id}"
      expect(page).to have_link("Players Index")
    end
  end
end
