require "rails_helper"

RSpec.describe "Teams Show", type: :feature do
  before :each do
    @team_united = Team.create!(name: "United", rank: 5, won_championship: true)
    @team_chelsea = Team.create!(name: "Chelsea", rank: 3, won_championship: true)
    @team_liverpool = Team.create!(name: "Liverpool", rank: 2, won_championship: true)

    @player_pogba = Player.create!(name: "Pogba", age: 28, injured: false, team_id: @team_united.id)
    @player_fernandes = Player.create!(name: "Fernandes", age: 27, injured: false, team_id: @team_united.id)
    @player_pulisic = Player.create!(name: "Pulisic", age: 22, injured: true, team_id: @team_chelsea.id)
    @player_havertz = Player.create!(name: "Havertz", age: 26, injured: false, team_id: @team_chelsea.id)
    @player_salah = Player.create!(name: "Salah", age: 29, injured: false, team_id: @team_liverpool.id)
    @player_virgil = Player.create!(name: "Virgil", age: 31, injured: false, team_id: @team_liverpool.id)
  end

  describe "#show" do
    it "returns parent by id w/ attributes" do
      visit "/teams/#{@team_united.id}"
      expect(page).to have_content(@team_united.name)
      expect(page).to have_content(@team_united.rank)
      expect(page).to have_content(@team_united.won_championship)
    end

    it "displays count of players on team" do
      visit "/teams/#{@team_united.id}"
      expect(page).to have_content("Player Count: 2")
    end

    it "has link to teams index" do
      visit "/teams/#{@team_united.id}"
      expect(page).to have_link("Teams Index")
      click_link("Teams Index")
      expect(page).to have_content("United")
      expect(page).to have_content("Chelsea")
      expect(page).to have_content("Liverpool")
    end

    it "has link to players index" do
      visit "/teams/#{@team_united.id}"
      expect(page).to have_link("Players Index", href: "/players")
    end

    it "has link to teams players index" do
      visit "/teams/#{@team_united.id}"
      expect(page).to have_link("United Players")
      click_link("United Players")
      expect(page).to have_content("Pogba")
      expect(page).to have_content("Fernandes")
    end

    it "has link to update team" do
      visit "/teams/#{@team_united.id}"
      expect(page).to have_link("Update")
    end

    it "has link to delete team" do
      visit "/teams/#{@team_united.id}"
      expect(page).to have_button("Delete")
    end
  end
end
