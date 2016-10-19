require 'factory_girl_rails'

def create_users(amt)
  amt.times do
    FactoryGirl.create(:user)
  end
end

create_users(20)
