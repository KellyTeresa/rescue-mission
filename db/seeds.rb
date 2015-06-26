# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = FactoryGirl.create(:user)
questions = []

5.times do
  questions << FactoryGirl.create(:question, user: user)
end

helper = FactoryGirl.create(:user)

questions.each do |question|
  2.times do
    FactoryGirl.create(:answer, question: question, user: helper)
  end
end
