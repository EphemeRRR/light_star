# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "cleaning db"
SuperCategory.destroy_all
SubCategory.destroy_all
Video.destroy_all
VideoCategory.destroy_all
puts "cleaning completed"

puts "creating super categories :"
cat1 = SuperCategory.create!(name: "Physiques, Chimies & Technologies")
cat2 = SuperCategory.create!(name: "Terre & Univers")
cat3 = SuperCategory.create!(name: "Les Vivants")
cat4 = SuperCategory.create!(name: "Sports & Santés")
cat5 = SuperCategory.create!(name: "Cultures & Sociétés")
cat6 = SuperCategory.create!(name: "Langues & Languages")
cat7 = SuperCategory.create!(name: "Mathématiques")
cat8 = SuperCategory.create!(name: "Histoires")
cat9 = SuperCategory.create!(name: "Techniques")
puts "adding #{SuperCategory.all.count} super categories in db."

puts "creating sub categories :"
cat11 = SubCategory.new(name: "Technologies")
cat11.super_category = cat1
cat11.save
cat12 = SubCategory.new(name: "Matière & Matériaux")
cat12.super_category = cat1
cat12.save
cat13 = SubCategory.new(name: "Interactions & Mécaniques")
cat13.super_category = cat1
cat13.save
cat21 = SubCategory.new(name: "Astronomies & Cosmologies")
cat21.super_category = cat2
cat21.save
cat22 = SubCategory.new(name: "Terre & Géologie")
cat22.super_category = cat2
cat22.save
cat23 = SubCategory.new(name: "Géographies")
cat23.super_category = cat2
cat23.save
cat31 = SubCategory.new(name: "Environnements")
cat31.super_category = cat3
cat31.save
cat32 = SubCategory.new(name: "Le Monde Végétal")
cat32.super_category = cat3
cat32.save
cat33 = SubCategory.new(name: "Le Monde Animal")
cat33.super_category = cat3
cat33.save
cat41 = SubCategory.new(name: "Corps Humains")
cat41.super_category = cat4
cat41.save
cat42 = SubCategory.new(name: "Santés")
cat42.super_category = cat4
cat42.save
cat43 = SubCategory.new(name: "Sports")
cat43.super_category = cat4
cat43.save
cat51 = SubCategory.new(name: "Arts")
cat51.super_category = cat5
cat51.save
cat52 = SubCategory.new(name: "Philosophies & social")
cat52.super_category = cat5
cat52.save
cat53 = SubCategory.new(name: "Politiques & Gestions")
cat53.super_category = cat5
cat53.save
cat54 = SubCategory.new(name: "Histoires & Passés")
cat54.super_category = cat5
cat54.save
puts "adding #{SubCategory.all.count} sub categories in db."

puts "creating videos :"
video1 = Video.create!(title: "Le deep learning", youtube_id: "trWrEWfhTVg", duration_seconds: 1207, minimum_age: 14)
video2 = Video.create!(title: "Les ondes gravitationnelles - A chaud", youtube_id: "1WKWEbmaN30", duration_seconds: 1098, minimum_age: 15)
video3 = Video.create!(title: "Le paradoxe de la morale", youtube_id: "W-GAqomxGmo", duration_seconds: 1163, minimum_age: 16)
puts "adding #{Video.all.count} videos in db."

puts "creating tag (video_category relation) :"
tag1 = VideoCategory.new
  tag1.video = video1
  tag1.sub_category = cat11
  tag1.relevance = 90
  tag1.save

tag2 = VideoCategory.new
  tag2.video = video1
  tag2.sub_category = cat52
  tag2.relevance = 10
  tag2.save

tag3 = VideoCategory.new
  tag3.video = video2
  tag3.sub_category = cat11
  tag3.relevance = 20
  tag3.save

tag4 = VideoCategory.new
  tag4.video = video2
  tag4.sub_category = cat13
  tag4.relevance = 40
  tag4.save

tag5 = VideoCategory.new
  tag5.video = video2
  tag5.sub_category = cat21
  tag5.relevance = 40
  tag5.save

tag6 = VideoCategory.new
  tag6.video = video3
  tag6.sub_category = cat52
  tag6.relevance = 80
  tag6.save

tag7 = VideoCategory.new
  tag7.video = video3
  tag7.sub_category = cat53
  tag7.relevance = 20
  tag7.save
puts "adding #{VideoCategory.all.count} tags in db."
