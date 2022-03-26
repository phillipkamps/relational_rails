require "rails_helper"

RSpec.describe "Players Index", type: :feature do
  describe "#index" do
    it "returns list of all player records" do
      team_united = Team.create!(name: "United", rank: 5, won_championship: true)
      team_chelsea = Team.create!(name: "Chelsea", rank: 3, won_championship: true)
      player_pogba = Player.create!(name: "Pogba", age: 28, injured: false, team_id: team_united.id)
      player_fernandes = Player.create!(name: "Fernandes", age: 27, injured: false, team_id: team_united.id)
      player_pulisic = Player.create!(name: "Pulisic", age: 22, injured: true, team_id: team_chelsea.id)

      visit "/players"
      expect(page).to have_content("Pogba")
      expect(page).to have_content("Fernandes")
      expect(page).to have_content("Pulisic")
      expect(page).to have_content("28")
      expect(page).to have_content("true")
    end

    it "has link to teams index" do
      visit "/players"
      expect(page).to have_link("Teams Index")
    end

    it "has link to players index" do
      visit "/players"
      expect(page).to have_link("Players Index")
    end
  end
end
