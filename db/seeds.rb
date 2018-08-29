# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)






cat1 = Category.create!(name: "Physiques, Chimies & Technologies")
cat2 = Category.create!(name: "Terre & Univers")
cat3 = Category.create!(name: "Les Vivants")
cat4 = Category.create!(name: "Sports & Santés")
cat5 = Category.create!(name: "Cultures & Sociétés")
cat6 = Category.create!(name: "Langues & Languages")
cat7 = Category.create!(name: "Mathématiques")
cat8 = Category.create!(name: "Histoires")
cat9 = Category.create!(name: "Techniques")


cat11 = Category.new(name: "Technologies")
cat11.parent = cat1
cat11.save
cat12 = Category.new(name: "Matière & Matériaux")
cat12.parent = cat1
cat12.save
cat13 = Category.new(name: "Interactions & Mécaniques")
cat13.parent = cat1
cat13.save
cat21 = Category.new(name: "Astronomies & Cosmologies")
cat21.parent = cat2
cat21.save
cat22 = Category.new(name: "Terre & Géologie")
cat22.parent = cat2
cat22.save
cat23 = Category.new(name: "Géographies")
cat23.parent = cat2
cat23.save
cat31 = Category.new(name: "Environnements")
cat31.parent = cat3
cat31.save
cat32 = Category.new(name: "Le Monde Végétal")
cat32.parent = cat3
cat32.save
cat33 = Category.new(name: "Le Monde Animal")
cat33.parent = cat3
cat33.save
cat41 = Category.new(name: "Corps Humains")
cat41.parent = cat4
cat41.save
cat42 = Category.new(name: "Santés")
cat42.parent = cat4
cat42.save
cat43 = Category.new(name: "Sports")
cat43.parent = cat4
cat43.save
cat51 = Category.new(name: "Arts")
cat51.parent = cat5
cat51.save
cat52 = Category.new(name: "Histoires & Passés")
cat52.parent = cat5
cat52.save
cat53 = Category.new(name: "Politiques & Gestions")
cat53.parent = cat5
cat53.save

#  video1 = Video.create!(title: , youtube_id: , duration_seconds: , minimum_age: )
