require 'rails_helper'

describe "The sign up procces", type: :feature do
  
  it "creates a new user" do
    visit "/signup" 

    fill_in "Username",         with: "username"
    fill_in "Email"   ,         with: "user@gmail.com"
    fill_in "Password",         with: "pass1234"
    fill_in "Confirm Password", with: "pass1234"
    click_button "Create User"

    user = User.where(email: "user@gmail.com")

    expect(user).to exist
  end

  it "fails and raises an error if invalid information is entered", js: true, type: :feature do
    def invalid_signup
      visit "/signup" 

      fill_in "Username",         with: "username"
      fill_in "Email"   ,         with: "usergmailcom"
      fill_in "Password",         with: "pass"
      fill_in "Confirm Password", with: "pass1234"
      click_button "Create User"
    end

    expect(invalid_signup).to raise_error
  end

end
