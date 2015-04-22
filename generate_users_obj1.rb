require 'json'
#
# # Convert to Ruby Object to JSON
# hash = {"name" => "Mr. Dewey"} # this is a ruby object
# json_string = JSON.generate(hash)
#
# # Restore JSON to Ruby Object
# ruby_object = JSON.parse(json_string) # this is a hash

# data = {"ndewey@westport.k12.ct.us" => {
#     "name" => "Mr. Dewey",
#     "password" => "5f4dcc3b5aa765d61d8327deb882cf99", # hashed
#     "favorite_color" => "Blue", # sample personal fact
#     "fifth_piece_of_data" => "Cheetahs" # you must have five
# }}
#
# emails = []
#
# data = {}
#
# emails.each do |email|
#     data[email] = record
# end
#
# puts data["ndewey@westport.k12.ct.us"]["name"]

# emails are the key and the data are the values

# RANDOM
# rand(number)
# => random numbers between 0 and number
#
# [].sample
# => random element of an array
#
# [].shuffle
# randomizes an array

numbers = ('1'..'50').to_a
numbers = numbers.shuffle

initials = ("a".."z").to_a

f = File.new("lastnames.txt", "r")
names = f.read.chomp.downcase
f.close

names = names.split("\n")

emails = []

names.each do |a|
    emails.push(initials.sample + a + numbers.sample + "@gmail.com")
end

require 'digest/md5'

password = Digest::MD5.hexdigest("password")
colors = ["red", "orange", "yellow", "green", "blue", "purple", "pink", "brown", "black", "grey"]
animals = ["fish", "cat", "bird", "dog", "bear", "lizard", "cheetah", "dolphin", "whale", "frog", "crocodile", "snake"]
foods = ["pizza", "cookies", "vegetables", "fruit", "bread", "french fries", "sandwiches", "ice cream", "pasta"]
country = ["United States", "France", "Canada", "Mexico", "United Kingdom", "Italy", "Germany", "Russia", "China", "Japan", "India"]

h = {}

emails.each do |e|
    h[e] = {"password" => password, "favorite color" => colors.sample, "favorite animal" => animals.sample, "favorite food" => foods.sample, "country of birth" => country.sample}
end

json_string = JSON.generate(h)

f = File.new("./json.txt", "r")
f.close

f = File.new("./json.txt", "w")
f.write json_string
f.close
