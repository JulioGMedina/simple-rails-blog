FactoryGirl.define do
  factory :post do
    content 'content for post'
    association :user, factory: :user
  end
end