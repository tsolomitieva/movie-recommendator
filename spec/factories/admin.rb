FactoryBot.define do
  factory :admin do
    email { "test@gmail.com" }
    password  { "123456" }
    role { "admin" }
  end
end