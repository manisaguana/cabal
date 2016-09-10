require 'rails_helper'

describe User, type: :model do

  it "has a valid factory" do
    expect(create(:user)).to be_valid
  end

  it "is invalid without a username" do
    expect(build(:user, username: nil)).to_not be_valid
  end

  it "is invalid without an email" do
    expect(build(:user, email: nil)).to_not be_valid
  end

  it "is invalid if email is not unique" do
    user1 = create(:user, email: "blarp@gmail.com")
    user2 = build(:user, email: "blarp@gmail.com")

    expect(user1).to be_valid
    expect(user2).to_not be_valid
  end

  it "is invalid without password" do
    expect(build(:user, password_digest: nil)).to_not be_valid
  end

end
