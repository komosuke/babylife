FactoryBot.define do
  factory :tweet do
    title         { Faker::Lorem.sentence }
    content       { Faker::Lorem.sentence }
    genre         {1}
    association :user

    after(:build) do |tweet|
      tweet.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
