FactoryBot.define do
  factory :user do
    name 'user'
    sequence(:email) { |n| 'user' + n.to_s + '@example.com' }
    password 'test'
    password_confirmation 'test'
  end
end
