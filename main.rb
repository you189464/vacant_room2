require 'sinatra'
require 'nokogiri'
require 'open-uri'

get '/' do
  # send_file File.join(settings.public_folder, 'index.html')
  "Hello, world! This is a simple Sinatra app."
end

post "/fetch" do
    html = URI.open("https://www.hotenavi.com/myth-bb/empty")
    doc = Nokogiri::HTML(html)

    # title = doc.title
    hotel_name = doc.at_css("#footerHotelInfo ul li")&.text
    empty_room = doc.at_css(".epEmptyRoomClm")&.text
    empty_detail = doc.at_css(".epEmptyRoomTxt")&.text
    clean_room = doc.at_css(".epCleanRoomClm")&.text
    clean_detail = doc.at_css(".epCleanRoomTxt")&.text
    time = doc.at_css(".epEmptyCleanRoomDate")&.text

    <<~HTML
    <p>#{hotel_name}</p>
    <p>#{empty_room}: #{empty_detail}</p>
    <p>#{clean_room}: #{clean_detail}</p>
    <p>#{time}</p>
    HTML

    # <h2>#{title}</h2>
    # <p>#{hotel_name}</p>
end
