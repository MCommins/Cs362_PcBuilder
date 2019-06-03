RSpec.describe Computer, type: :system do
  it "allows the user to make a computer with no parts" do
    visit new_part_path
    fill_in "Name", with: "Saphire Tech"
    fill_in "Part", with: "Graphics Card"
    fill_in "Compatibility", with: 3
    click_on("Create Part")

    visit new_computer_path
    fill_in "Name", with: "Cool Computer"
    click_on("Create Computer")
    expect(page).to have_content("Cool Computer")
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
    select "Narrow sieve", from: "Part 1"
    select "Mysterious torus", from: "Part 2"
    select "Tall obelisk", from: "Part 3"
    click_on("Create Computer")

    expect(page).to have_content("Narrow sieve")
    expect(page).to have_content("Mysterious torus")
    expect(page).to have_content("Tall obelisk")
  end

  it "allows a computer to be made that is owned by an account" do
      visit new_account_path
      fill_in "Name", with: "Me"
      click_on("Create Account")

      visit new_computer_path
      fill_in "Name", with: "Cool Computer"
      select "Me"
      click_on("Create Computer")

      expect(page).to have_content("Me")
  end
end
