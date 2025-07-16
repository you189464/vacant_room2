require 'sinatra'
require 'nokogiri'
require 'open-uri'

post "/fetch" do
    html = URI.open("https://www.hotenavi.com/myth-bb/empty")
    doc = Nokogiri::HTML(html)

    title = doc.title
    empty_room = doc.at_css(".epEmptyRoomClm")&.text
    empty_detail = doc.at_css(".epEmptyRoomTxt")&.text
    clean_room = doc.at_css(".epCleanRoomClm")&.text
    clean_detail = doc.at_css(".epCleanRoomTxt")&.text

    <<~HTML
    <h2>#{title}</h2>
    <p>#{empty_room}: #{empty_detail}</p>
    <p>#{clean_room}: #{clean_detail}</p>
    HTML
end
