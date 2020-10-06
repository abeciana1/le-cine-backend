# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Club.destroy_all
Movie.destroy_all
ClubWatchlist.destroy_all
Watchlist.destroy_all
Meeting.destroy_all
MovieMeeting.destroy_all
UserClub.destroy_all

puts "starting seed"

puts "users"
User.create(first_name: "Alex", last_name: "Beciana", email: "alex@test.com" ,birthday: "1994-08-17", image: "https://avatars1.githubusercontent.com/u/36319554?s=400&u=492c8442f54f3c200317d6304f612f05f3b5b085&v=4", password: "1234", admin: true)
30.times do
    User.create(first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, email: Faker::Internet.unique.email, birthday: Faker::Date.between(from: '1985-09-23', to: '1996-09-25'), image: Faker::Avatar.image, Faker::Internet.password, admin: false)
end

puts "clubs"
10.times do
    Club.create(name: Faker::Restaurant.unique.name, about: "All about movies", city: Faker::Address.unique.city, state: Faker::Address.unique.state, country: Faker::Address.unique.country, image: Faker::Avatar.image, member_count: rand(15...25), memory_capacity: 35, privacy: false, host_id: User.all.sample.id)
    Club.create(name: "PRIVATE CLUB", about: "All about movies", city: Faker::Address.unique.city, state: Faker::Address.unique.state, country: Faker::Address.unique.country, image: Faker::Avatar.image, member_count: rand(15...25), memory_capacity: 35, privacy: true, host_id: User.all.sample.id)
end

puts "movie"