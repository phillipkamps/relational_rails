require "rails_helper"

RSpec.describe "Update player" do
  it "updates player record" do
    @team_united = Team.create!(name: "United", rank: 5, won_championship: true)
    @player_fernandes = Player.create!(name: "Fernandes", age: 27, injured: false, team_id: @team_united.id)

    visit "/players/#{@player_fernandes.id}/edit"
    fill_in "Name", with: "Bruno Fernandes"
    fill_in "Age", with: "27"
    click_button "Update Player"
    expect(current_path).to eq("/players/#{@player_fernandes.id}")
    expect(page).to have_content("Bruno Fernandes")
  end
end
