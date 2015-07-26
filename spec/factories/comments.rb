FactoryGirl.define do
  factory :comment do
    content 'content for comment'
    association :user, factory: :user
    association :post, factory: :post
  end
end