require 'open-uri'
require 'nokogiri'
require 'json'


url = "https://www.universalis.fr/classification/techniques/informatique/"
sub_categories = []

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('.with-counter a').each do |element|
  # puts element.text.strip
  subcategory_path = element.attribute('href').value
  subcategory = subcategory_path.split('/').last
  parent = subcategory_path.split('/')[-2]

  sub_categories << {
  	name: 	"#{subcategory}",
    parent: "#{parent}"
  }

	new_html_file = open("https://www.universalis.fr#{subcategory_path}").read
	new_html_doc = Nokogiri::HTML(new_html_file)
	new_html_doc.search('.with-counter a').each do |new_element|

		new_subcategory_path = new_element.attribute('href').value
		new_subcategory = new_subcategory_path.split('/').last
		new_parent = new_subcategory_path.split('/')[-2]

		sub_categories << {
			name: 	"#{new_subcategory}",
			parent: "#{new_parent}"
		}
	end



  h = { sub_categories: sub_categories }

  File.open("/mnt/c/Users/EphemeRRR/Desktop/encyclo.json","w") do |f|
    f << h.to_json
  end

end
