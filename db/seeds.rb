# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "deleting seeded DB"
Movie.destroy_all

puts "seeding db"

url = 'http://tmdb.lewagon.com/movie/top_rated'
user_serialized = URI.open(url).read
user = JSON.parse(user_serialized)

user["results"][0..4].each do |movie|
  Movie.create(
    title: movie["original_title"],
    overview: movie["overview"],
    poster_url: movie["poster_path"],
    rating: rand(1..20)
    )
end

puts "all good"
