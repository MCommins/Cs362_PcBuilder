require "rails_helper"

RSpec.describe Account, type: :system do

  it "shows all your computers on your account page" do
    visit new_account_path
    fill_in "Name", with: "Ethan"
    click_on("Create Account")

    visit new_computer_path
    fill_in "Name", with: "Cool Computer"
    select "Ethan"
    click_on("Create Computer")

    visit accounts_path
    click_on("Ethan")
    expect(page).to have_content("Cool Computer")
  end

  it "doesn't show someone else's computers on your account page" do
    visit new_account_path
    fill_in "Name", with: "Ethan"
    click_on("Create Account")

    visit new_account_path
    fill_in "Name", with: "Michael"
    click_on("Create Account")

    visit new_computer_path
    fill_in "Name", with: "Cool Computer"
    select "Ethan"
    click_on("Create Computer")

    visit accounts_path
    click_on("Michael")
    expect(page).not_to have_content("Cool Computer")
  end

  it "shows you the parts of each of your computers" do
    visit new_account_path
    fill_in "Name", with: "Ethan"
    click_on("Create Account")

    visit new_part_path
    fill_in "Name", with: "Saphire Tech"
    fill_in "Part", with: "Graphics Card"
    fill_in "Compatibility", with: 3
    select "Ethan", from: "part_account"
    click_on("Create Part")
    visit new_computer_path
    fill_in "Name", with: "Cool Computer"
    select "Ethan"
    select "Saphire Tech", from: "Part 1"
    click_on("Create Computer")

    expect(page).to have_content("Saphire Tech")

    visit accounts_path
    click_on "Ethan"
    expect(page).to have_content("Saphire Tech")
  end
end
