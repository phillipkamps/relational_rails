require "rails_helper"

RSpec.describe "Players Index", type: :feature do
  describe "#index" do
    let!(:team_united) { Team.create!(name: "United", rank: 5, won_championship: true) }
    let!(:team_chelsea) { Team.create!(name: "Chelsea", rank: 3, won_championship: true) }
    let!(:player_pogba) { Player.create!(name: "Pogba", age: 28, injured: false, team_id: team_united.id) }
    let!(:player_fernandes) { Player.create!(name: "Fernandes", age: 27, injured: false, team_id: team_united.id) }
    let!(:player_pulisic) { Player.create!(name: "Pulisic", age: 22, injured: true, team_id: team_chelsea.id) }

    it "returns list of all player records where injured is true" do
      visit "/players"
      expect(page).to have_no_content("Pogba")
      expect(page).to have_no_content("Fernandes")
      expect(page).to have_content("Pulisic")
      expect(page).to have_content("22")
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

    it "has link to update each player" do
      visit "/players"
      expect(page).to have_link("Update", href: "/players/#{player_pulisic.id}/edit")
    end
  end
end
