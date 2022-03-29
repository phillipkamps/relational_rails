require "rails_helper"

RSpec.describe "New team" do
  it "creates new team record" do
    visit "/teams/new"
    fill_in "Name", with: "United"
    fill_in "Rank", with: "4"
    check "Won championship"
    click_button "Create Team"
    expect(current_path).to eq("/teams")
    expect(page).to have_content("United")
  end
end
