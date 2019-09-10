require 'open-uri'
require 'nokogiri'


puts "aurevoir le monde"
Destination.destroy_all

puts "un monde sauvage apparait"
Destination.create(destination_name: "Madrid",
                  country_name: "Espagne",
                  photo_link: "https://images.kiwi.com/photos/600x600/madrid_es.jpg")
puts "destination 1 done"
Destination.create(destination_name: "Barcelone",
                  country_name: "Espagne",
                  photo_link: "https://images.kiwi.com/photos/600x600/barcelona_es.jpg")
puts "destination 2 done"
Destination.create(destination_name: "Porto",
                  country_name: "Portugal",
                  photo_link: "https://images.kiwi.com/photos/600x600/porto_pt.jpg")
puts "destination 3 done"
Destination.create(destination_name: "Venise",
                  country_name: "Italie",
                  photo_link: "https://images.kiwi.com/photos/600x600/venice_it.jpg")
puts "destination 4 done"
Destination.create(destination_name: "Berlin",
                  country_name: "Allemagne",
                  photo_link: "https://images.kiwi.com/photos/600x600/berlin_de.jpg")
puts "destination 5 done"
Destination.create(destination_name: "Milan",
                  country_name: "Italie",
                  photo_link: "https://images.kiwi.com/photos/600x600/milan_it.jpg")
puts "destination 6 done"
Destination.create(destination_name: "Amsterdam",
                  country_name: "Pays-Bas",
                  photo_link: "https://images.kiwi.com/photos/600x600/amsterdam_nl.jpg")
puts "destination 7 done"
Destination.create(destination_name: "Dublin",
                  country_name: "Irlande",
                  photo_link: "https://images.kiwi.com/photos/600x600/dublin_ie.jpg")
puts "destination 8 done"

Destination.pluck(:destination_name).each do |city|
  puts "======= Scrapping #{city} ========="
  url = "https://www.numbeo.com/cost-of-living/in/#{city}?displayCurrency=EUR"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.data_wide_table').each do |item|
    destination = Destination.find_by(destination_name: city)
    destination.update(
      water_price: item.text.match(/Water.\W1.5.+€/)[0]
    )
  end
end
