FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user-#{n}@example.com" }
    password              "testing123"
    password_confirmation "testing123"
  end
end
