require 'rails_helper'

describe User, type: :model do

  it "has a valid factory" do
    expect(create(:user)).to be_valid
  end

  it "is invalid without a username" do
    user = build(:user, username: nil)

    expect(user).to_not be_valid
  end

  it "is invalid if username is not unique" do 
    user1 = create(:user, username: "blarp")
    user2 = build(:user, username: "blarp")
    user2.username.capitalize!

    expect(user1).to be_valid
    expect(user2).to_not be_valid
  end

  it "is invalid if username is too long" do 
    user = build(:user, username: "a"*50)

    expect(user).to_not be_valid
  end

  it "is invalid without an email" do
    user = build(:user, email: nil)

    expect(user).to_not be_valid
  end

  it "is invalid if email is not unique" do
    user1 = create(:user, email: "blarp@gmail.com")
    user2 = build(:user, email: "blarp@gmail.com")

    expect(user1).to be_valid
    expect(user2).to_not be_valid
  end

  it "is invalid if email is too long" do
    user = build(:user, email: "a"*56)

    expect(user).to_not be_valid
  end

  it "is invalid if email is not in the correct format" do
    user = build(:user, email: "lksdj;lfasjdf;lkajshdfskjhf")

    expect(user).to_not be_valid
  end

  it "is invalid if password and/or confirmation are not present" do
    missing_pass    = build(:user, password: " "*8, password_confirmation: "blarpblarp")
    missing_confirm = build(:user, password: "blarpblarp", password_confirmation: " "*8)

    expect(missing_pass).to_not be_valid
    expect(missing_confirm).to_not be_valid
  end

  it "is invalid without matching password confirmation" do
    valid_confirmation   = build(:user, password: "blarpblarp", password_confirmation: "blarpblarp")
    invalid_confirmation = build(:user, password: "blarpblarp", password_confirmation: "cheeseybread")

    expect(valid_confirmation).to be_valid
    expect(invalid_confirmation).to_not be_valid
  end

  it "is invalid if password is too short" do
    user = build(:user, password: "blarp")

    expect(user).to_not be_valid
  end

end
