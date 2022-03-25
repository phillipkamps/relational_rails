require "rails_helper"

RSpec.describe "Teams Players Index", type: :feature do
  describe "#index" do
    it "returns list of all player records under same team id" do
      team_united = Team.create!(name: "United", rank: 5, won_championship: true)
      player_pogba = Player.create!(name: "Pogba", age: 28, injured: false, team_id: team_united.id)
      player_fernandes = Player.create!(name: "Fernandes", age: 27, injured: false, team_id: team_united.id)

      visit "/teams/#{team_united.id}/players"
      expect(page).to have_content("Pogba")
      expect(page).to have_content("28")
      expect(page).to have_content("false")
      expect(page).to have_content("1")
      expect(page).to have_content("Fernandes")
      expect(page).to have_content("27")
    end
  end
end
