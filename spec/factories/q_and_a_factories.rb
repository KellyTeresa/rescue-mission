require 'factory_girl_rails'
require 'faker'

FactoryGirl.define do
  factory :question do
    sequence(:title) {|n| "#{n}: Cupcake ipsum dolor sit amet."}
    description Faker::Lorem.paragraph(3)
  end

  factory :answer do
    question_id nil
    description Faker::Lorem.paragraph(2)
  end

end
