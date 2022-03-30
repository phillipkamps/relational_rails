require "rails_helper"

RSpec.describe "Delete Team", type: :feature do
  let!(:team_united) { Team.create!(name: "United", rank: 5, won_championship: true) }
  let!(:team_chelsea) { Team.create!(name: "Chelsea", rank: 3, won_championship: true) }
  let!(:team_liverpool) { Team.create!(name: "Liverpool", rank: 2, won_championship: true) }
  let!(:player_pogba) { Player.create!(name: "Pogba", age: 28, injured: false, team_id: team_united.id) }
  let!(:player_pulisic) { Player.create!(name: "Pulisic", age: 22, injured: true, team_id: team_chelsea.id) }

  it "deletes a team" do
    visit "/teams/#{team_united.id}"
    click_button "Delete"
    expect(current_path).to eq("/teams")
    expect(page).to have_no_content("United")

    visit "/players"
    expect(page).to have_no_content("Pogba")
    expect(page).to have_content("Pulisic")
  end
end
