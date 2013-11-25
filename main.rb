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
questions = doc.css('.question_link').map { |q| q.children.last.children.last.text }
links = doc.css('.question_link').map { |link| link['href'] }

p questions, links

binding.pry