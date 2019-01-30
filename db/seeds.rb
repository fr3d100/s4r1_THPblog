# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Article.destroy_all

random_usr = Random.new

10.times do 

	User.create(first_name: Faker::Name.first_name  ,last_name: Faker::Name.last_name ,email: Faker::Internet.email)

end

puts "10 users ont été créés"



10.times do 
	Article.create(title: Faker::Pokemon.name , content: "This pokemon can be caught in #{Faker::Pokemon.location}" ,user: User.find(random_usr.rand(10)+1))
end

puts "10 articles ont été créés"
