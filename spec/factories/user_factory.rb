require 'factory_girl_rails'
require 'faker'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    provider 'github'
    uid {Faker::Number.number(7)}
  end
end
