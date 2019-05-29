RSpec.describe Computer, type: :system do
  it "allows the user to make a computer with no parts" do
    visit new_part_path
    fill_in "Name", with: "Saphire Tech"
    fill_in "Part", with: "Graphics Card"
    fill_in "Compatibility", with: 3
    click_on("Create Part")
    visit new_computer_path
    fill_in "Name", with: "Cool Computer"
    fill_in "Owner", with: "Me"
    click_on("Create Computer")
    expect(page).to have_content("Cool Computer")
    expect(page).to have_content("Me")
  end

  it "allows making a computer with many different parts" do
    visit new_part_path
    fill_in "Name", with: "Narrow sieve"
    fill_in "Part", with: "Slime processor"
    fill_in "Compatibility", with: 3
    click_on("Create Part")

    visit new_part_path
    fill_in "Name", with: "Mysterious torus"
    fill_in "Part", with: "Particle collider"
    fill_in "Compatibility", with: 3
    click_on("Create Part")

    visit new_part_path
    fill_in "Name", with: "Tall obelisk"
    fill_in "Part", with: "Alien antenna"
    fill_in "Compatibility", with: 3
    click_on("Create Part")

    visit new_computer_path
    fill_in "Name", with: "Cool Computer"
    fill_in "Owner", with: "Me"
    select "Narrow sieve", from: "part_1"
    select "Mysterious torus", from: "part_2"
    select "Tall obelisk", from: "part_3"
    click_on("Create Computer")

    expect(page).to have_content("Cool Computer")
    expect(page).to have_content("Me")
  end

end
