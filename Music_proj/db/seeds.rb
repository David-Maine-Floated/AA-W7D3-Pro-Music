# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all 
Band.destroy_all 

User.create(email: 'david@buffguys.com', password: 'hihihi')
User.create(email: 'muja@noodleboys.com', password: 'kittens')

Band.create(name: 'Peter Maine')
Band.create(name: 'David AM')
Band.create(name: 'Porches')
Band.create(name: 'Frankie Cosmos')
Band.create(name: 'French DJ')
