FactoryBot.define do
  factory :memory do
    title         { Faker::Lorem.sentence }
    content       { Faker::Lorem.sentence }
    memory_date   { '2021-01-01'}
    association :user
  end
end
