# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

questions = [
  {
  title: "Donut chupa chups toffee marzipan?",
  description: "Danish cake cotton candy fruitcake jelly tiramisu biscuit sesame snaps. Apple pie chocolate sweet."
  },
  {
  title: "Jujubes bonbon cake chupa chups liquorice?",
  description: "Sweet chocolate cake halvah liquorice lollipop powder candy."
  },
  {
  title: "Cookie carrot cake?",
  description: "Tiramisu caramels chocolate. Lollipop caramels dragée marzipan sesame snaps icing lollipop halvah."
  },
  {
  title: "Bear claw muffin jelly?",
  description: "Gingerbread muffin bonbon pie. Pastry wafer icing caramels icing jujubes. Lollipop muffin chocolate carrot cake."
  }
]

questions.each do |question|
  new_q = Question.new(title: question[:title], description: question[:description])
  new_q.save if new_q.valid?
end
