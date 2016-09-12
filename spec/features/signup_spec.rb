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

end
