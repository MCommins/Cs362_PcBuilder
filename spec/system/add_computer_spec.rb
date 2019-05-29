RSpec.describe Computer, type: :system do
  it "allows the user to make a computer" do
    visit new_part_path
    fill_in "Name", with: "Saphire Tech"
    fill_in "Part", with: "Graphics Card"
    fill_in "Compatibility", with: 3
    click_on("Create Part")
    visit new_computer_path
    fill_in "Name", with: "Cool Computer"
    fill_in "Owner", with: "Me"
    select "Saphire Tech", from: "part_1"
    select "Saphire Tech", from: "part_2"
    select "Saphire Tech", from: "part_3"
    click_on("Create Computer")
    expect(page).to have_content("Cool Computer")
    expect(page).to have_content("Me")
  end
end
