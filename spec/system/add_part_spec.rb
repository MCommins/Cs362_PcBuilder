require "rails_helper"

RSpec.describe "adding parts to the list", type: :system do
  #happy path
  it "allows the user to add in parts" do
    visit new_part_path
    fill_in "Name", with: "Saphire Tech"
    fill_in "Part", with: "Graphics Card"
    fill_in "Compatability", with: 3
    click_on("Create Part")
    expect(page).to have_content("Saphire Tech")
    expect(page).to have_content("Graphics Card")
    expect(page).to have_content(3)
  end

  #sad path


end