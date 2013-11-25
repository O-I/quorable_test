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
questions = doc.css('.link_text').map(&:text)
# expanded_texts = doc.css('.expanded_q_text').map { }
links = doc.css('.question_link').map { |link| link['href'] }

p questions, links

binding.pry