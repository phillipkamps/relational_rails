require "rails_helper"

RSpec.describe "Delete Team", type: :feature do
  let!(:team_united) { Team.create!(name: "United", rank: 5, won_championship: true) }
  let!(:team_chelsea) { Team.create!(name: "Chelsea", rank: 3, won_championship: true) }
  let!(:team_liverpool) { Team.create!(name: "Liverpool", rank: 2, won_championship: true) }
  let!(:player_pogba) { Player.create!(name: "Pogba", age: 28, injured: true, team_id: team_united.id) }
  let!(:player_virgil) { Player.create!(name: "Virgil", age: 29, injured: true, team_id: team_liverpool.id) }

  it "deletes a team" do
    visit "/teams"
    within "[data-id=#{team_liverpool.id}]" do
      click_link "Delete"
    end
    expect(current_path).to eq("/teams")
    expect(page).to have_no_content("Liverpool")

    visit "/players"
    expect(page).to have_no_content("Virgil")
    expect(page).to have_content("Pogba")
  end
end
