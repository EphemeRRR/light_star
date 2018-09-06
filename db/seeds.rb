require 'open-uri'
require 'nokogiri'

puts "cleaning db"
Job.destroy_all
SubCategory.destroy_all
SuperCategory.destroy_all
Video.destroy_all
VideoCategory.destroy_all
User.destroy_all
puts "cleaning completed"


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


job1 = Job.new(title: "Médecin", url: "https://fr.wikipedia.org/wiki/Médecin")
job1.sub_category = cat42
job1.save

job2 = Job.new(title: "Développeur", url: "https://fr.wikipedia.org/wiki/Développeur")
job2.sub_category = cat11
job2.save

job3 = Job.new(title: "Laborantin", url: "https://fr.wikipedia.org/wiki/Technicien_de_laboratoire")
job3.sub_category = cat12
job3.save

job4 = Job.new(title: "Barman", url: "https://fr.wikipedia.org/wiki/Barman")
job4.sub_category = cat51
job4.save

job5 = Job.new(title: "Arboriculteur", url: "https://fr.wikipedia.org/wiki/Arboriculteur")
job5.sub_category = cat32
job5.save

job6 = Job.new(title: "Viticulteur", url: "https://fr.wikipedia.org/wiki/Vigneron")
job6.sub_category = cat32
job6.save

job7 = Job.new(title: "Chaudronnier", url: "https://fr.wikipedia.org/wiki/Chaudronnier")
job7.sub_category = cat13
job7.save

job8 = Job.new(title: "Chargé de recrutement", url: "https://fr.wikipedia.org/wiki/Recruteur")
job8.sub_category = cat53
job8.save

job9 = Job.new(title: "assistant social", url: "https://fr.wikipedia.org/wiki/Assistant_de_service_social")
job9.sub_category = cat52
job9.save


def seed_all
  categories = %w(sciences-de-la-vie espace physique sante sciences-sociales chimie technologie-innovation systeme-terre passe politique environnement) # can add maths later

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

    count = 0
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
            vid = Video.create!(title: video.title, youtube_id: yt_id, duration_seconds: video.duration, minimum_age: 99, description: video.description, channel: video.channel_title, verified: true, introduction: true, pro: false)

          end

          tag = VideoCategory.new(relevance: 100)
          tag.sub_category = subcategory
          tag.video = vid
          tag.save

        end
      end
      count += 1
    end
    puts "add #{count} videos in #{category}"

  end
  rescue Yt::Errors::NoItems => e
  puts e.message
end

seed_all

puts "adding #{Video.all} videos in db."
