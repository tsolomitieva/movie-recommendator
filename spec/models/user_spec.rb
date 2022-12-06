require 'rails_helper'

RSpec.describe User, type: :model do
  it "is not valid without a password" do
    user=User.new(password = nil)
    expect(user).to_not be_valid
  end
  it "is not valid without a email" do
    user=User.new(email = nil)
    expect(user).to_not be_valid
  end
  
   it { should validate_presence_of(:password) }

end
