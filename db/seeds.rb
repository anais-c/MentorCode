# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "...seeding the database..."

User.destroy_all
Expert.destroy_all
#Available_time.destroy_all

# seed some users
#clark, jason, tony = User.create([
  #{name: "Clark Kent", email: "clark@ironhack.com", password: "ironhack", password_confirmation: "ironhack"},
  #{name: "Clark Kent", email: "clark@ironhack.com", password: "ironhack", password_confirmation: "ironhack"},
  #{name: "Clark Kent", email: "clark@ironhack.com", password: "ironhack", password_confirmation: "ironhack"}
  #])

#this will be the admin
#User.create!(first_name: "example",
             #last_name: "forexample",
             #email: "example@mail.com"
             #password: "ironhack",
             #password_confirmation: "ironhack")


#5.times do |n|

  #firstname = Faker::Name.first_name
  #lastname = Faker::Name.last_name
  #email = Faker::Internet.email
  #location = "Barcelona"
  #password = "password"
  
  #User.create!(firstname: firstname,
               #lastname: lastname,
               #email: email,
               #location: location,
               #password:              password,
               #password_confirmation: password)  
#end


#5.times do |i|
  #Expert.create(firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.email,
                #experience: Faker::Hacker.say_something_smart, location: "Barcelona", password: "password",
                #password_confirmation: "password")
#end

#Expert.all.each do |expert|
  #expert.available_times.create(date: Faker::Date.forward(30), start_time: Faker::Number.between(1, 10), end_time: Faker::Number.between(1, 10))
  #expert.available_times.create(date: Faker::Date.forward(30), start_time: Faker::Number.between(1, 10), end_time: Faker::Number.between(1, 10))
#end

