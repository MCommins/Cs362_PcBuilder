require "rails_helper"

RSpec.describe Account, type: :system do

  it "shows all your computers on your account page" do
    visit new_account_path
    fill_in "Name", with: "Ethan"
    click_on("Create Account")

    visit new_computer_path
    fill_in "Name", with: "Cool Computer"
    fill_in "Owner", with: "Me"
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
    fill_in "Owner", with: "Me"
    select "Ethan"
    click_on("Create Computer")

    visit accounts_path
    click_on("Michael")
    expect(page).not_to have_content("Cool Computer")
  end


end
