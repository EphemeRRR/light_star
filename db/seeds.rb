require 'open-uri'
require 'nokogiri'

puts "cleaning db"
SuperCategory.destroy_all
SubCategory.destroy_all
Video.destroy_all
VideoCategory.destroy_all
User.destroy_all
puts "cleaning completed"

# user = User.(email: "francoismarie.verdier@gmail.com", password: "password", password_confirmation: "password", admin: true)

puts "creating super categories :"
cat1 = SuperCategory.create!(name: "Physique, Chimie & Technologie")
cat2 = SuperCategory.create!(name: "Terre & Univers")
cat3 = SuperCategory.create!(name: "Le Vivant")
cat4 = SuperCategory.create!(name: "Sport & Santé")
cat5 = SuperCategory.create!(name: "Culture & Société")
cat6 = SuperCategory.create!(name: "Langue & Language")
cat7 = SuperCategory.create!(name: "Mathématique")
cat8 = SuperCategory.create!(name: "Histoire")
cat9 = SuperCategory.create!(name: "Technique")
puts "adding #{SuperCategory.all.count} super categories in db."

puts "creating sub categories :"
cat11 = SubCategory.new(name: "Technologie")
cat11.super_category = cat1
cat11.save
cat12 = SubCategory.new(name: "Matière & Matériaux")
cat12.super_category = cat1
cat12.save
cat13 = SubCategory.new(name: "Interaction & Mécanique")
cat13.super_category = cat1
cat13.save
cat21 = SubCategory.new(name: "Astronomie & Cosmologie")
cat21.super_category = cat2
cat21.save
cat22 = SubCategory.new(name: "Terre & Géologie")
cat22.super_category = cat2
cat22.save
cat23 = SubCategory.new(name: "Géographie")
cat23.super_category = cat2
cat23.save
cat31 = SubCategory.new(name: "Environnement")
cat31.super_category = cat3
cat31.save
cat32 = SubCategory.new(name: "Le Monde Végétal")
cat32.super_category = cat3
cat32.save
cat33 = SubCategory.new(name: "Le Monde Animal")
cat33.super_category = cat3
cat33.save
cat41 = SubCategory.new(name: "Corps Humain")
cat41.super_category = cat4
cat41.save
cat42 = SubCategory.new(name: "Santé")
cat42.super_category = cat4
cat42.save
cat43 = SubCategory.new(name: "Sport")
cat43.super_category = cat4
cat43.save
cat51 = SubCategory.new(name: "Art")
cat51.super_category = cat5
cat51.save
cat52 = SubCategory.new(name: "Philosophie & social")
cat52.super_category = cat5
cat52.save
cat53 = SubCategory.new(name: "Politique & Gestion")
cat53.super_category = cat5
cat53.save
cat54 = SubCategory.new(name: "Histoire & Passé")
cat54.super_category = cat5
cat54.save
puts "adding #{SubCategory.all.count} sub categories in db."

categories = %w(sciences-de-la-vie espace physique sante sciences-sociales chimie maths technologie-innovation systeme-terre passe politique environnement)

categories.each do |category|
  cafe_html = "http://www.cafe-sciences.org/#{category}/page/"

  case category
  when "sciences-de-la-vie"
    subcategory = SubCategory.find_by(name: "Le Monde Animal")
  when "espace"
    subcategory = SubCategory.find_by(name: "Astronomie & Cosmologie")
  when "physique"
    subcategory = SubCategory.find_by(name: "Interaction & Mécanique")
  when "sante"
    subcategory = SubCategory.find_by(name: "Santé")
  when "sciences-sociales"
    subcategory = SubCategory.find_by(name: "Philosophie & social")
  when "chimie"
    subcategory = SubCategory.find_by(name: "Matière & Matériaux")
  when "technologie-innovation"
    subcategory = SubCategory.find_by(name: "Technologie")
  when "systeme-terre"
    subcategory = SubCategory.find_by(name: "Terre & Géologie")
  when "passe"
    subcategory = SubCategory.find_by(name: "Histoire & Passé")
  when "politique"
    subcategory = SubCategory.find_by(name: "Politique & Gestion")
  when "environnement"
    subcategory = SubCategory.find_by(name: "Environnement")
  end

  for i in (1..10)
    html_content = open("#{cafe_html}#{i}").read
    doc = Nokogiri::HTML(html_content)

    doc.search('.entry-title a').each do |element|
      if /^https:\/\/www.youtube.com\/watch\?v=.{11}$/.match(element['href'])

        yt_id = element['href'][-11, 11]

        if Video.find_by(youtube_id: yt_id) != nil
          vid = Video.find_by(youtube_id: yt_id)

        else
          video = Yt::Video.new id: yt_id
          vid = Video.create!(title: video.title, youtube_id: yt_id, duration_seconds: video.duration, minimum_age: 99, description: video.description, channel: video.channel_title)

        end

        tag = VideoCategory.new(relevance: 100)
        tag.sub_category = subcategory
        tag.video = vid
        tag.save

      end
    end
    puts "Hé hé"

  end
  puts "YEAH !!!"

end

puts "adding #{Video.all} videos in db."

