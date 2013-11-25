require 'open-uri'
require 'nokogiri'
require 'json'
require 'pry'

def normalize(topic)
  topic.split(' ').map(&:downcase).map(&:capitalize).join('-')
end

base_url = 'https://www.quora.com'
topic = 'data structures'
topic = normalize(topic)

doc = Nokogiri::HTML.parse(open("#{base_url}/#{topic}"))
doc.css('.question_link').each do |question|
  puts question.children.last.children.last
end
binding.pry