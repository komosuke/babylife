FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { 'a12345' }
    password_confirmation { password }
    birthday              { '2020-01-01' }
    profile               { 'はじめまして' }
  end
end