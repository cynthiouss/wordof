# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Professional.destroy_all
Specialty.destroy_all
Category.destroy_all
User.destroy_all

["Doctor", "Lawyer", "Teacher", "Architect"].each do |p|
  category = Category.new
  category.name = p
  category.save!
end

p "#{Category.count} categories created"

["Pediatrics", "Dermatology", "Family Medicine", "Otolaryngology", "Dentistry", "Ophthalmology"].each do |d|
  specialty = Specialty.new
  specialty.name = d
  specialty.category = Category.find_by_name("Doctor")
  specialty.save!
end

["Labour and Employment", "Divorce", "Child Custody", "Medical Malpractice", "Civil Litigation"].each do |l|
  specialty = Specialty.new
  specialty.name = l
  specialty.category = Category.find_by_name("Lawyer")
  specialty.save!
end

["Math", "English", "Physics", "French"].each do |t|
  specialty = Specialty.new
  specialty.name = t
  specialty.category = Category.find_by_name("Teacher")
  specialty.save!
end

["Commercial spaces", "Institutional spaces", "Family houses", "Interior design"].each do |a|
  specialty = Specialty.new
  specialty.name = a
  specialty.category = Category.find_by_name("Architect")
  specialty.save!
end

p "#{Specialty.count} specialties created"

pictures = [
  "http://res.cloudinary.com/cynthiouss/image/upload/v1459861312/face_3.jpg",
  "http://res.cloudinary.com/cynthiouss/image/upload/v1459861450/face_5.jpg",
  "http://res.cloudinary.com/cynthiouss/image/upload/v1459861688/face_9.jpg",
  "http://res.cloudinary.com/cynthiouss/image/upload/v1459861513/face_6.jpg"
]

(1..40).each do |i|
  user = User.new
  user.email = i.to_s + '@example.com'
  user.password = 'valid_password'
  user.password_confirmation = 'valid_password'
  user.name = Faker::Name.name
  user.picture = pictures.shuffle.sample
  user.city = ["Brussels", "Ghent", "Antwerp", "Paris"].shuffle.sample
  user.save!

  if i%2 == 0
    Professional.create!(user_id: user.id, specialty_id: Specialty.all.sample.id, languages: ["English", "French"].sample, prof_email: i.to_s + '@company.com')
  end
end

p "#{User.count} users created"

p "#{Professional.count} professionals created"

