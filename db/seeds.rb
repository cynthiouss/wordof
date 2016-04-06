# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

pictures = [
  'http://res.cloudinary.com/cynthiouss/image/upload/c_scale,w_200/v1459861816/face_10.jpg'
]

categories = ["Doctor", "Handyman", "Lawyer"]
languages = ["English", "French", "German", "Dutch"]

(1..10).each do |i|
  user = User.new
  user.email = i.to_s + '@example.com'
  user.password = 'valid_password'
  user.password_confirmation = 'valid_password'
  user.name = Faker::Name.name
  user.picture = pictures.shuffle.sample
  user.city = Faker::Address.city
  user.save!
end

p "#{User.count} users created"
