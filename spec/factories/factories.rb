require 'factory_girl_rails'
require 'faker'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :question do
    sequence(:title) {|n| "#{n}: Cupcake ipsum dolor sit amet apple pie carrot cake."}
    description Faker::Lorem.paragraph(8)
  end

end
