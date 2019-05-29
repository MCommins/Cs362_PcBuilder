require "rails_helper"

RSpec.describe Account, type: :system do

  it "allows creating an account" do
    visit new_account_path
    fill_in "Name", with: "Ethan"
    click_on("Create Account")
    visit accounts_path
    expect(page).to have_content("Ethan")
  end

end
