require "rails_helper"

RSpec.describe "Players Show", type: :feature do
  describe "#show" do
    it "returns player by id w/ attributes" do
      team_united = Team.create!(name: "United", rank: 5, won_championship: true)
      team_chelsea = Team.create!(name: "Chelsea", rank: 3, won_championship: true)
      player_pogba = Player.create!(name: "Pogba", age: 28, injured: false, team_id: team_united.id)
      player_fernandes = Player.create!(name: "Fernandes", age: 27, injured: false, team_id: team_united.id)
      player_pulisic = Player.create!(name: "Pulisic", age: 22, injured: true, team_id: team_chelsea.id)

      visit "/players/#{player_pulisic.id}"
      expect(page).to have_content("Pulisic")
      expect(page).to have_content("22")
      expect(page).to have_content("true")
      expect(page).to have_content(player_pulisic.team_id)
    end

    it "has link to teams index" do
      team_united = Team.create!(name: "United", rank: 5, won_championship: true)
      team_chelsea = Team.create!(name: "Chelsea", rank: 3, won_championship: true)
      player_pogba = Player.create!(name: "Pogba", age: 28, injured: false, team_id: team_united.id)
      player_fernandes = Player.create!(name: "Fernandes", age: 27, injured: false, team_id: team_united.id)
      player_pulisic = Player.create!(name: "Pulisic", age: 22, injured: true, team_id: team_chelsea.id)

      visit "/players/#{player_fernandes.id}"
      expect(page).to have_link("Teams Index")
    end

    it "has link to players index" do
      team_united = Team.create!(name: "United", rank: 5, won_championship: true)
      team_chelsea = Team.create!(name: "Chelsea", rank: 3, won_championship: true)
      player_pogba = Player.create!(name: "Pogba", age: 28, injured: false, team_id: team_united.id)
      player_fernandes = Player.create!(name: "Fernandes", age: 27, injured: false, team_id: team_united.id)
      player_pulisic = Player.create!(name: "Pulisic", age: 22, injured: true, team_id: team_chelsea.id)

      visit "/players/#{player_fernandes.id}"
      expect(page).to have_link("Players Index")
    end
  end
end
