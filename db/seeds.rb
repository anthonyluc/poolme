# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: "toto", last_name: "TOTO", email: "toto@gmail.com", username: "toto", password: "castors", gender: "m")
User.create(first_name: "titi", last_name: "TITI", email: "titi@gmail.com", username: "titi", password: "castors", gender: "m")
User.create(first_name: "tata", last_name: "TATA", email: "tata@gmail.com", username: "tata", password: "castors", gender: "f")
