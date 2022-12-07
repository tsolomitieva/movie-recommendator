require 'rails_helper'

RSpec.describe User, type: :model do
  it "is not valid without a password" do
    user=User.new(email: 'test@gmail.com', password: nil)
    expect(user).to_not be_valid
  end
  it "is not valid without a email" do
    user=User.new(email: nil, password: '123456')
    expect(user).to_not be_valid
  end
  it "gives user as default role" do
    user = User.new(email: 'test@gmail.com', password: '123456')
    expect(user.role).to eq("user")
  end

end
