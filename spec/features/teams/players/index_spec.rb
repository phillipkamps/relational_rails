require "rails_helper"

RSpec.describe "Teams Players Index", type: :feature do
  before :each do
    @team_united = Team.create!(name: "United", rank: 5, won_championship: true)
    @team_chelsea = Team.create!(name: "Chelsea", rank: 3, won_championship: true)
    @team_liverpool = Team.create!(name: "Liverpool", rank: 2, won_championship: true)

    @player_pogba = Player.create!(name: "Pogba", age: 28, injured: false, team_id: @team_united.id)
    @player_fernandes = Player.create!(name: "Fernandes", age: 27, injured: false, team_id: @team_united.id)
    @player_ronaldo = Player.create!(name: "Ronaldo", age: 38, injured: false, team_id: @team_united.id)
    @player_pulisic = Player.create!(name: "Pulisic", age: 22, injured: true, team_id: @team_chelsea.id)
    @player_havertz = Player.create!(name: "Havertz", age: 26, injured: false, team_id: @team_chelsea.id)
    @player_salah = Player.create!(name: "Salah", age: 29, injured: false, team_id: @team_liverpool.id)
    @player_virgil = Player.create!(name: "Virgil", age: 31, injured: false, team_id: @team_liverpool.id)
  end

  it "returns list of all player records under same team id in alphabetical order" do
    visit "/teams/#{@team_united.id}/players"
    expect("Fernandes").to appear_before("Pogba")
    expect("Pogba").to appear_before("Ronaldo")
  end

  it "has link to teams index" do
    visit "/teams/#{@team_united.id}/players"
    expect(page).to have_link("Teams Index")
  end

  it "has link to players index" do
    visit "/teams/#{@team_united.id}/players"
    expect(page).to have_link("Players Index")
  end

  it "has link to create player" do
    visit "/teams/#{@team_united.id}/players"
    expect(page).to have_link("Create Player")
  end

  it "has link to update each player" do
    visit "/teams/#{@team_united.id}/players"
    expect(page).to have_link("Update", href: "/players/#{@player_pogba.id}/edit")
    expect(page).to have_link("Update", href: "/players/#{@player_fernandes.id}/edit")
    expect(page).to have_link("Update", href: "/players/#{@player_ronaldo.id}/edit")
  end
end
