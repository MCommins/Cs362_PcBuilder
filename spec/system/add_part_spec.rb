require "rails_helper"

RSpec.describe "adding parts to the list", type: :system do
  #happy path
  it "allows the user to add in parts" do
    visit new_part_path
    fill_in "Name", with: "Saphire Tech"
    fill_in "Part", with: "Graphics Card"
    fill_in "Compatibility", with: 3
    click_on("Create Part")
    expect(page).to have_content("Saphire Tech")
    expect(page).to have_content("Graphics Card")
    expect(page).to have_content(3)
  end

  it "can have multiple parts in the list" do
    visit new_part_path
    fill_in "Name", with: "AMD Ryzen 2700X"
    fill_in "Part", with: "CPU"
    fill_in "Compatibility", with: 3
    click_on("Create Part")

    visit new_part_path
    fill_in "Name", with: "ASUS X470"
    fill_in "Part", with: "Motherboard"
    fill_in "Compatibility", with: 7
    click_on("Create Part")

    expect(page).to have_content("AMD Ryzen 2700X")
    expect(page).to have_content("CPU")
    expect(page).to have_content(3)

    expect(page).to have_content("ASUS X470")
    expect(page).to have_content("Motherboard")
    expect(page).to have_content(7)
  end

  #it "has a default part for a blank part name" do
    # don't know if we actually WANT this.
  # At the very lest, we need a NAME and a COMPATIBILITY. Do we want "default" behavior?
  # Are there any parts that don't have a "part name"?
  #end

  #sad path
  it "does not allow the user to add parts with empty fields" do
    visit new_part_path
    fill_in "Name", with: ""
    fill_in "Part", with: ""
    click_on("Create Part")
    #byebug
    expect(page).to have_text("prohibited this list from being saved")
  end

  it "does not allow the user to add a nonsensical compatibility number" do
    visit new_part_path
    fill_in "Name", with: "ASUS X470"
    fill_in "Part", with: "Motherboard"
    fill_in "Compatibility", with: -1
    click_on("Create Part")

    expect(page).to have_text("prohibited this list from being saved")
  end

  it "does not allow the user to add a non-integer compatibility number" do
    visit new_part_path
    fill_in "Name", with: "ASUS X470"
    fill_in "Part", with: "Motherboard"
    fill_in "Compatibility", with: "TEST"
    click_on("Create Part")

    expect(page).to have_text("prohibited this list from being saved")
  end

  it "doesn't allow duplicate parts" do
    visit new_part_path
    fill_in "Name", with: "ASUS X470"
    fill_in "Part", with: "Motherboard"
    fill_in "Compatibility", with: 7
    click_on("Create Part")

    visit new_part_path
    fill_in "Name", with: "asus x470"
    fill_in "Part", with: "Motherboard"
    fill_in "Compatibility", with: 15
    click_on("Create Part")

  expect(page).to have_text("prohibited this list from being saved")
  end

  it "allows the user to identify a part with an account" do
    visit new_account_path
    fill_in "Name", with: "Ethan"
    click_on("Create Account")

    visit new_part_path
    fill_in "Name", with: "Saphire Tech"
    fill_in "Part", with: "Graphics Card"
    fill_in "Compatibility", with: 3
    select "Ethan", from: "part_account"
    click_on("Create Part")
    expect(page).to have_content("Saphire Tech")
    expect(page).to have_content("Graphics Card")
    expect(page).to have_content(3)
    expect(page).to have_content("Ethan")
  end

end
