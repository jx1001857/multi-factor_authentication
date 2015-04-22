require 'json'
# require 'io/console' #this is the part that isn't working
require 'digest/md5'

f = File.new("./json.txt", 'r')
json = f.read
f.close

data = JSON.parse(json)

puts "Email?"
email = gets.chomp

record = data[email]

if record == nil
  puts "This user does not exist."
  exit
end

puts "Password?"
password = gets.chomp #STDIN.noecho(&:gets).chomp #isn't working

hashed_password = Digest::MD5.hexdigest(password)

stored_password = record[password]

if stored_password == nil
  puts "Password is incorrect."
  exit
end

array = record.to_a

array.shift

question = array.sample[0]

puts "What is your #{question}?"
answer = gets.chomp.downcase

stored_answer = record[question].downcase

if hashed_password == stored_password and stored_answer == answer
  puts "Authenticated!"
else
  puts "Not Authenticated. Please try again."
end