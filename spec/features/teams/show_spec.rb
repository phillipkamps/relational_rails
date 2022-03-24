require "rails_helper"

RSpec.describe "Teams Show", type: :feature do
  describe "#show" do
    it "returns parent by id w/ attributes" do
      team_1 = Team.create!(name: "United", rank: 5, won_championship: true)
      team_2 = Team.create!(name: "City", rank: 1, won_championship: true)

      visit "/teams/#{team_1.id}"
      expect(page).to have_content(team_1.name)
      expect(page).to have_content(team_1.rank)
      expect(page).to have_content(team_1.won_championship)
    end
  end
end
