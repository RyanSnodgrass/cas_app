FactoryGirl.define do
  
  factory :person do
    name Faker::Name.name
  end

  factory :comment do
    body Faker::Lorem.sentence
  end

  factory :post do
    title Faker::App.name
    body Faker::Lorem.paragraph
  end
end
