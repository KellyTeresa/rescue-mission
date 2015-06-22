# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

questions = [
  {
  title: "Donut chupa chups toffee marzipan macaroon?",
  description: "Danish cake cotton candy fruitcake jelly tiramisu biscuit sesame snaps. Apple pie chocolate sweet. Sugar plum donut ice cream sugar plum ice cream cake caramels. Dragée pie tiramisu lemon drops."
  },
  {
  title: "Jujubes bonbon cake chupa chups liquorice caramels candy canes?",
  description: "Sweet chocolate cake halvah liquorice lollipop powder candy. Cheesecake tiramisu cookie oat cake cake biscuit ice cream. Chocolate candy sweet roll powder. Marshmallow marzipan chocolate cake dragée tiramisu brownie. Jelly beans candy chocolate powder gingerbread marzipan carrot cake bear claw pie. Marshmallow liquorice jelly beans. Candy cookie powder liquorice soufflé biscuit chocolate cake."
  },
  {
  title: "Oat cake ice cream icing. Cookie carrot cake pudding pastry pastry?",
  description: "Tiramisu caramels chocolate. Lollipop caramels dragée marzipan sesame snaps icing lollipop halvah. Biscuit cake biscuit cheesecake bonbon marshmallow liquorice. Croissant lemon drops cake chocolate cake dragée marzipan tootsie roll. Sugar plum gummi bears wafer bonbon cake liquorice lollipop macaroon. Toffee tart oat cake tart chocolate cake bear claw. Dessert gummies fruitcake brownie jelly beans tootsie roll marzipan tiramisu toffee. Candy pie pastry gingerbread tart dessert liquorice icing sugar plum."
  },
  {
  title: "Bear claw muffin jelly. Donut cake sweet marshmallow caramels brownie?",
  description: "Gingerbread muffin bonbon pie. Pastry wafer icing caramels icing jujubes. Lollipop muffin chocolate carrot cake. Bear claw candy chocolate cake bonbon marshmallow sugar plum dessert tootsie roll. Carrot cake ice cream chupa chups brownie. Caramels sugar plum macaroon icing macaroon macaroon."
  },
  {
  title: "Gingerbread candy cake gummi bears pastry sugar plum chupa chups gummies. Sesame snaps caramels lollipop bonbon?",
  description: "Candy canes soufflé tootsie roll tart danish cupcake chocolate bar. Pie gummies halvah cheesecake gummies gummi bears jelly-o. Marshmallow soufflé halvah jelly-o gummi bears carrot cake sweet roll carrot cake tootsie roll. Brownie icing ice cream cookie gummies."
  }
]

questions.each do |question|
  Question.create(title: question[:title], description: question[:description])
end
