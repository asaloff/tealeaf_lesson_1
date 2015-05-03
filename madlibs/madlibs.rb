def say(message)
  puts "=> #{message}"
end

def end_with_message(message)
  puts "#{message}"
  exit
end 

nouns = File.open('nouns.txt', 'r') do |file|
  file.read
end.split

verbs = File.open('verbs.txt', 'r') do |file|
  file.read
end.split

adjectives = File.open('adjectives.txt', 'r') do |file|
  file.read
end.split

end_with_message("No file added") if ARGV.empty?
end_with_message("File does not exist") if !File.exists?(ARGV[0])

content = File.open('sentences.txt', 'r') do |file|
  file.read
end

content.gsub!('NOUN') do |noun|
  noun = nouns.sample
end

content.gsub!('VERB') do |verb|
  verb = verbs.sample
end

content.gsub!('ADJECTIVE') do |adjective|
  adjective = adjectives.sample
end

puts content