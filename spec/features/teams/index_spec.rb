require "rails_helper"

RSpec.describe "Teams Index", type: :feature do
  let!(:team_united) { Team.create!(name: "United", rank: 5, won_championship: true) }
  let!(:team_chelsea) { Team.create!(name: "Chelsea", rank: 3, won_championship: true) }
  let!(:team_liverpool) { Team.create!(name: "Liverpool", rank: 2, won_championship: true) }

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

    it "has link to update each team" do
      visit "/teams"
      expect(page).to have_link("Update #{team_united.name}", href: "/teams/#{team_united.id}/edit")
      expect(page).to have_link("Update #{team_chelsea.name}", href: "/teams/#{team_chelsea.id}/edit")
      expect(page).to have_link("Update #{team_liverpool.name}", href: "/teams/#{team_liverpool.id}/edit")
    end
  end
end
