require 'rails_helper'

describe "The sign up procces", type: :feature do
  
  it "creates a new user", js: true do
    visit "/signup" 

    fill_in "Username",         with: "username"
    fill_in "Email",            with: "user@gmail.com"
    fill_in "Password",         with: "pass1234"
    fill_in "Confirm Password", with: "pass1234"
    click_button "Submit"

    user = User.where(email: "user@gmail.com")

    expect(user).to exist
  end

  it "fails and raises an error if invalid information is entered", type: :feature do
    visit "/signup" 

    fill_in "Username",         with: "username2"
    fill_in "Email",            with: "user2@gmail.com"
    fill_in "Password",         with: "pass"
    fill_in "Confirm Password", with: "pass1234"
    click_button "Submit"

    expect(page).to have_css(".errors")
  end

end
