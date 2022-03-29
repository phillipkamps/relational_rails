require "rails_helper"

RSpec.describe "Update team" do
  it "updates team record" do
    @team_united = Team.create!(name: "United", rank: 5, won_championship: true)

    visit "/teams/#{@team_united.id}/edit"
    fill_in "Name", with: "Manchester United"
    fill_in "Rank", with: "4"
    check "Won championship"
    click_button "Submit"
    expect(current_path).to eq("/teams/#{@team_united.id}")
    expect(page).to have_content("Manchester United")
  end
end
