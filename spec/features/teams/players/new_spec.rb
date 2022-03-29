require "rails_helper"

RSpec.describe "Create player" do
  it "creates player record" do
    @team_united = Team.create!(name: "United", rank: 5, won_championship: true)

    visit "/teams/#{@team_united.id}/players/new"
    fill_in "Name", with: "Rashford"
    fill_in "Age", with: "24"
    click_button "Create Player"
    expect(current_path).to eq("/teams/#{@team_united.id}/players")
    expect(page).to have_content("Rashford")
  end
end
