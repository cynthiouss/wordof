# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Professional.destroy_all
User.destroy_all

pictures = [
  "http://res.cloudinary.com/cynthiouss/image/upload/v1459861312/face_3.jpg",
  "http://res.cloudinary.com/cynthiouss/image/upload/v1459861450/face_5.jpg",
  "http://res.cloudinary.com/cynthiouss/image/upload/v1459861688/face_9.jpg",
  "http://res.cloudinary.com/cynthiouss/image/upload/v1459861513/face_6.jpg"
]


(1..10).each do |i|
  user = User.new
  user.email = i.to_s + '@example.com'
  user.password = 'valid_password'
  user.password_confirmation = 'valid_password'
  user.name = Faker::Name.name
  user.picture = pictures.shuffle.sample
  user.city = Faker::Address.city
  user.save!

  if i%2 == 0
    Professional.create!(user_id: user.id, category: Faker::Company.profession, specialty: Faker::Team.creature, languages: Faker::Config.locale)
  end
end

p "#{User.count} users created"

p "#{Professional.count} users created"

