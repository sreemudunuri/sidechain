# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all

User.create(name: 'Drake')
User.create(name: 'Kanye')
User.create(name: 'Slowbeam')

Song.delete_all

Song.create(name: "Hot Line Bling", user_id: 1)
Song.create(name: "Gold Digger", user_id: 2)
Song.create(name: "Bike Ride", user_id: 3)
Song.create(name: "Gods Plan", user_id: 1)
Song.create(name: "Famous", user_id: 2)

Comment.delete_all

Comment.create(content: "Improve your vocals", user_id: 3, song_id: 2)
Comment.create(content: "cool", user_id: 3, song_id: 1)
Comment.create(content: "Needs more bass", user_id: 3, song_id: 4)
Comment.create(content: "I sing better than you", user_id: 1, song_id: 2)
Comment.create(content: "I am the next president", user_id: 2, song_id: 5)
