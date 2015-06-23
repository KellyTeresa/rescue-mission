require 'factory_girl_rails'
require 'faker'

FactoryGirl.define do
  factory :question do
    sequence(:title) {|n| "#{n}: Cupcake ipsum dolor sit amet apple pie carrot cake."}
    description Faker::Lorem.paragraph(8)
  end

  factory :answer do
    question_id 1
    description Faker::Lorem.paragraph(5)
  end

end
