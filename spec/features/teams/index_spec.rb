require "rails_helper"

RSpec.describe "Teams Index", type: :feature do
  describe "#index" do
    it "returns list of all team records" do
      team_united = Team.create!(name: "United", rank: 5, won_championship: true)
      team_city = Team.create!(name: "City", rank: 1, won_championship: true)
      team_chelsea = Team.create!(name: "Chelsea", rank: 3, won_championship: true)

      visit "/teams"
      expect(page).to have_content("United")
      expect(page).to have_content("City")
      expect(page).to have_content("Chelsea")
    end

    it "sorts teams by most recently created" do
      team_united = Team.create!(name: "United", rank: 5, won_championship: true)
      team_city = Team.create!(name: "City", rank: 1, won_championship: true)
      team_chelsea = Team.create!(name: "Chelsea", rank: 3, won_championship: true)

      visit "/teams"
      expect("City").to appear_before("United")
      expect("Chelsea").to appear_before("City")
    end

    it "has link to teams index" do
      visit "/teams"
      expect(page).to have_link("Teams Index")
    end

    it "has link to players index" do
      visit "/teams"
      expect(page).to have_link("Players Index")
    end
  end
end
