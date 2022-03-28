require "rails_helper"

RSpec.describe "Teams Players Index", type: :feature do
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

  it "returns list of all player records under same team id" do
    visit "/teams/#{@team_united.id}/players"
    expect(page).to have_content("Pogba")
    expect(page).to have_content("28")
    expect(page).to have_content("false")
    expect(page).to have_content("1")
    expect(page).to have_content("Fernandes")
    expect(page).to have_content("27")
  end

  it "has link to teams index" do
    visit "/teams/#{@team_united.id}/players"
    expect(page).to have_link("Teams Index")
  end

  it "has link to players index" do
    visit "/teams/#{@team_united.id}/players"
    expect(page).to have_link("Players Index")
  end
end
