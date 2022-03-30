require "rails_helper"

RSpec.describe "Delete Player", type: :feature do
  let!(:team_united) { Team.create!(name: "United", rank: 5, won_championship: true) }
  let!(:player_pogba) { Player.create!(name: "Pogba", age: 28, injured: false, team_id: team_united.id) }
  let!(:player_fernandes) { Player.create!(name: "Fernandes", age: 26, injured: true, team_id: team_united.id) }

  it "deletes a player" do
    visit "/players/#{player_pogba.id}"
    click_button "Delete"
    expect(current_path).to eq("/players")
    expect(page).to have_no_content("Pogba")

    visit "/teams/#{team_united.id}/players"
    expect(page).to have_no_content("Pogba")
    expect(page).to have_content("Fernandes")
  end
end
