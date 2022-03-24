require "rails_helper"

RSpec.describe "Teams Index", type: :feature do
  describe "#index" do
    it "returns list of all parent records" do
      team_1 = Team.create!(name: "United", rank: 5, won_championship: true)
      team_2 = Team.create!(name: "City", rank: 1, won_championship: true)
      team_3 = Team.create!(name: "Chelsea", rank: 3, won_championship: true)

      visit "/teams"
      expect(page).to have_content("United")
      expect(page).to have_content("City")
      expect(page).to have_content("Chelsea")
    end
  end
end
