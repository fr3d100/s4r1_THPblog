# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# A chaque fois qu'on lance le seed on va supprimer toutes les données de la BDD
User.destroy_all
Article.destroy_all
Category.destroy_all
Comment.destroy_all
Like.destroy_all

# On initialise une variable pour générer des nombres aléatoire
random_nb = Random.new


# Création de 10 users
10.times do 
	User.create(first_name: Faker::Name.first_name  ,last_name: Faker::Name.last_name ,email: Faker::Internet.email)
end
puts "10 users ont été créés"


# Création de 5 catégories
5.times do
	Category.create(name: Faker::Pokemon.name)
end
puts "5 catégories ont été créés"


# Création de 10 articles
# On va récupérer aléatoirement un user dans la base des users
	random_id_user = random_nb.rand(10)
	u = User.find(User.all[random_id_user].id)
# On va récupérer aléatoirement un article dans la base des articles
	random_id_cat = random_nb.rand(5)
	c = Category.find(Category.all[random_id_cat].id)

10.times do 
	Article.create(title: Faker::Pokemon.name, content: "Tu peux trouver ce pokémon ici : #{Faker::Pokemon.location}", category: c, user: u)
end
puts "10 articles ont été créés"

# Creation de 15 commentaires
15.times do
	# On va récupérer aléatoirement un user dans la base des users
	random_id_user = random_nb.rand(10)
	u = User.find(User.all[random_id_user].id)
	# On va récupérer aléatoirement un article dans la base des articles
	random_id_art = random_nb.rand(10)
	a = Article.find(Article.all[random_id_art].id)

	# random_id_art = random_nb.rand(10)+1
	Comment.create(content: Faker::Simpsons.quote, user: u, article: a)
end
puts "15 commentaires ont été créés"


# Création de 15 likes
15.times do
	# On va récupérer aléatoirement un user dans la base des users
	random_id_user = random_nb.rand(10)
	u = User.find(User.all[random_id_user].id)
	# On va récupérer aléatoirement un article dans la base des articles
	random_id_art = random_nb.rand(10)
	a = Article.find(Article.all[random_id_art].id)

	Like.create(user: u, article: a)
end
puts "15 likes ont été créés"

