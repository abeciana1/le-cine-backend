# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'time'
require 'faker'

puts "deleting all"
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
alex = User.create(first_name: "Alex", last_name: "Beciana", email: "alex@test.com", birthday: "1994-08-17", image: "https://avatars1.githubusercontent.com/u/36319554?s=400&u=492c8442f54f3c200317d6304f612f05f3b5b085&v=4", password: "1234", admin: true)
30.times do
    User.create(first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, email: Faker::Internet.unique.email, birthday: Faker::Date.between('1985-09-23', '1996-09-25').to_s, image: Faker::Avatar.image, password: Faker::Internet.password, admin: false)
end

puts "clubs"
Club.create(name: "PRIVATE CLUB", about: "All about movies", city: Faker::Address.unique.city, state: Faker::Address.unique.state, country: Faker::Address.unique.country, image: Faker::Avatar.image, member_count: rand(15...25), member_capacity: 35, privacy: true, host_id: alex.id)
10.times do
    Club.create(name: "Fake Club Name", about: "All about movies", city: Faker::Address.unique.city, state: Faker::Address.unique.state, country: Faker::Address.unique.country, image: Faker::Avatar.image, member_count: rand(15...25), member_capacity: 35, privacy: false, host_id: User.all.sample.id)
end

puts "movie"
Movie.create(
    backdrop_path: "https://image.tmdb.org/t/p/original/rr7E0NoGKxvbkb89eR1GwfoYjpA.jpg",
    title: "Fight Club",
    poster_path: "https://image.tmdb.org/t/p/original/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg",
    mov_id: 550,
    overview: "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.",
    original_language: "English",
    release_date: "1999-10-15",
)

Movie.create(
    backdrop_path: "https://image.tmdb.org/t/p/original/wC36tEU7AqP5llAvjXkZhZ248tX.jpg",
    title: "Rocky",
    poster_path: "https://image.tmdb.org/t/p/original/O66XFv0mU6JKfmrgkoTQLwbFDG.jpg",
    mov_id: 1366,
    overview: "When world heavyweight boxing champion, Apollo Creed wants to give an unknown fighter a shot at the title as a publicity stunt, his handlers choose palooka Rocky Balboa, an uneducated collector for a Philadelphia loan shark. Rocky teams up with trainer  Mickey Goldmill to make the most of this once in a lifetime break.",
    original_language: "English",
    release_date: "1976-11-21"
)

puts "club watchlist"
3.times do
    ClubWatchlist.create(club_id: Club.all.sample.id, movie_id: Movie.all.sample.id)
end

puts "watchlist"
Watchlist.create(user_id: User.first.id, movie_id: Movie.all.sample.id)
Watchlist.create(user_id: alex.id, movie_id: Movie.all[1])

puts "meeting"
10.times do
    Meeting.create(date: Faker::Date.between('2020-09-23', '2020-10-31'), time: Time.strptime("4:20 PM", "%I:%M %P").strftime("%H:%M"), link: "https://www.youtube.com/watch?v=dQw4w9WgXcQ", title: "meeting title", about: "movie meeting", excerpt: "meeting excerpt", club_id: Club.all.sample.id)
end

puts "movie meeting"
3.times do
    MovieMeeting.create(movie_id: Movie.all.sample.id, meeting_id: Meeting.all.sample.id, discussion: false, watch_along: true)
end

puts "user club"
20.times do
    UserClub.create(club_id: Club.all.sample.id, user_id: User.all.sample.id)
end

puts "all  seeded"

0