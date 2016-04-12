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

["Allergy & Immunology", "Dermatology", "Family Medicine", "Internal Medicine", "Medical Genetics", "Neurology", "Obstetrics and Gynecology", "Orthopaedic Surgery", "Otolaryngology", "Pathology-Anatomic and Clinical", "Pediatrics", "Physical Medicine and Rehabilitation", "Plastic Surgery", "Psychiatry", "Oncology", "General Surgery", "Urology", "Pediatrics"].each do |d|
  specialty = Specialty.new
  specialty.name = d
  specialty.category = Category.find_by_name("Doctor")
  specialty.save!
end

["Alternative dispute resolution", "Bankruptcy", "Civil Litigation", "Child Custody", "Consumer", "Contract", "Copyright", "Divorce", "Immigration", "Labour and Employment", "Medical Malpractice", "Privacy", "Real Estate", "Tax"].each do |l|
  specialty = Specialty.new
  specialty.name = l
  specialty.category = Category.find_by_name("Lawyer")
  specialty.save!
end

["English", "French", "Latin", "Math", "Physics", "Chemistry", "Biology", "Geography", "Economics", "Social Sciences"].each do |t|
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

(1..80).each do |i|
  user = User.new
  user.email = i.to_s + '@example.com'
  user.password = 'valid_password'
  user.password_confirmation = 'valid_password'
  user.name = Faker::Name.name
  user.picture = "http://res.cloudinary.com/cynthiouss/image/upload/v1459861816/face_10.jpg"
  user.city = ["Brussels", "Ghent", "Antwerp", "Paris"].shuffle.sample
  user.save!

  if i%2 == 0
    Professional.create!(user_id: user.id, specialty_id: Specialty.all.sample.id, languages: ["English", "French"].sample, prof_email: i.to_s + '@company.com', description: "I'm the best in my field. Choose me and I'll get everything fixed!")
  end
end

p "#{User.count} users created"

p "#{Professional.count} professionals created"

