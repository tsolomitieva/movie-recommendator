FactoryBot.define do
  factory :user do
    email { "fakeuser@gmail.com" }
    password  { "123456" }

    trait :admin do
      email { "fakeadmin@gmail.com" }
      role { 1 }
    end
  end

  #factory :admin_user, parent: :user do
    #role { 1 }
  #end

end
