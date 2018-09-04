require 'open-uri'
require 'nokogiri'

# html_content = open('https://www.youtube.com/watch?v=JLfnqruE2Ss').read
# doc = Nokogiri::HTML(html_content)

# puts doc.search('#content')

# require 'open-uri'
# require 'nokogiri'

for i in (1..10)
  html_content = open("http://www.cafe-sciences.org/politique/page/#{i}").read
  doc = Nokogiri::HTML(html_content)

  doc.search('.entry-title a').each do |element|
    if /^https:\/\/www.youtube.com\/watch\?v=.{11}$/.match(element['href'])

      yt_id = element['href'][-11, 11]
      p yt_id
      video = Yt::Video.new id: yt_id
      p Video.create!(title: video.title, youtube_id: yt_id, duration_seconds: video.duration, minimum_age: 99, description: video.description)

    end
  end
end
