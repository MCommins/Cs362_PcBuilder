RSpec.describe Computer, type: :system do
  it "allows the user to make a computer" do
    visit new_computer_path
    fill_in "Name", with: "Cool Computer"
    fill_in "Owner", with: "Me"
    click_on("Create Computer")
    expect(page).to have_content("Cool Computer")
    expect(page).to have_content("Me")
  end
end
