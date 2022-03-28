require "rails_helper"

RSpec.describe "Teams Index", type: :feature do
  before :each do
    @team_united = Team.create!(name: "United", rank: 5, won_championship: true)
    @team_chelsea = Team.create!(name: "Chelsea", rank: 3, won_championship: true)
    @team_liverpool = Team.create!(name: "Liverpool", rank: 2, won_championship: true)
  end

  describe "#index" do
    it "returns list of all team records" do
      visit "/teams"
      expect(page).to have_content("United")
      expect(page).to have_content("Liverpool")
      expect(page).to have_content("Chelsea")
    end

    it "sorts teams by most recently created" do
      visit "/teams"
      expect("Liverpool").to appear_before("Chelsea")
      expect("Chelsea").to appear_before("United")
    end

    it "has link to teams index" do
      visit "/teams"
      expect(page).to have_link("Teams Index")
    end

    it "has link to players index" do
      visit "/teams"
      expect(page).to have_link("Players Index")
    end

    it "has link to create new team" do
      visit "/teams"
      expect(page).to have_link("New Team")
    end
  end
end
