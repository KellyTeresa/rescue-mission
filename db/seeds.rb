# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

user = FactoryGirl.create(:user)
questions = []

5.times do
  questions << Question.create(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph(3), user: user)
end
