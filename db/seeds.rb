require 'open-uri'
require 'nokogiri'


puts "aurevoir le monde"
Destination.destroy_all

puts "un monde sauvage apparait"
Destination.create(destination_name: "Madrid",

                  photo_link: "https://images.kiwi.com/photos/600x600/madrid_es.jpg")
puts "destination 1"
Destination.create(destination_name: "Barcelona",
                  photo_link: "https://images.kiwi.com/photos/600x600/barcelona_es.jpg")
puts "destination 2"
Destination.create(destination_name: "Porto",
                  photo_link: "https://images.kiwi.com/photos/600x600/porto_pt.jpg")
puts "destination 3"
Destination.create(destination_name: "Venice",
                  photo_link: "https://images.kiwi.com/photos/600x600/venice_it.jpg")
puts "destination 4"
Destination.create(destination_name: "Berlin",
                  photo_link: "https://images.kiwi.com/photos/600x600/berlin_de.jpg")
puts "destination 5"
Destination.create(destination_name: "Milan",
                  photo_link: "https://images.kiwi.com/photos/600x600/milan_it.jpg")
puts "destination 6"
Destination.create(destination_name: "Amsterdam",
                  photo_link: "https://images.kiwi.com/photos/600x600/amsterdam_nl.jpg")
puts "destination 7"
Destination.create(destination_name: "Dublin",
                  photo_link: "https://images.kiwi.com/photos/600x600/dublin_ie.jpg")
puts "destination 8"

Destination.create(destination_name: "Bamako",
                  photo_link: "https://images.kiwi.com/photos/600x600/bamako_ml.jpg")
puts "destination 9"

Destination.create(destination_name: "Paris",
                  photo_link: "https://images.kiwi.com/photos/600x600/paris_fr.jpg")
puts "destination 10"

Destination.create(destination_name: "Munich",
                  photo_link: "https://images.kiwi.com/photos/600x600/munich_de.jpg")
puts "destination 11"

Destination.create(destination_name: "Prague",
                  photo_link: "https://images.kiwi.com/photos/600x600/prague_cz.jpg")
puts "destination 12"

Destination.pluck(:destination_name).each do |city|
  puts "=== Scrapping #{city} ==="
  url = "https://www.numbeo.com/cost-of-living/in/#{city}?displayCurrency=EUR"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.data_wide_table').each do |item|
    destination = Destination.find_by(destination_name: city)
    destination.update(
           banana_price: item.text.match(/Banana.+€/)[0],
           water_price: item.text.match(/Water.\W1.5.+€/)[0],
           transport_price: item.text.match(/One-way Ticket.+€/)[0]
    )
  end
end
