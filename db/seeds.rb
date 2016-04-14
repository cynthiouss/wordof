# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Saved.destroy_all
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

women = [
  "v1459861688/face_9.jpg",
  "v1459861188/face_1.jpg",
  "v1459861188/face_2.jpg",
  "v1459861187/face_4.jpg",
  "v1459861312/face_3.jpg"
]

men = [
  "v1459861450/face_5.jpg",
  "v1459861513/face_6.jpg",
  "v1459861950/face_11.jpg",
  "v1459861644/face_8.jpg"
]

architects = [
  "v1460644023/wordof/architect_woman_8.png",
  "v1460644025/wordof/architect_woman_7.jpg",
  "v1460644024/wordof/architect_woman_6.jpg",
  "v1460644023/wordof/architect_woman_5.jpg",
  "v1460644022/wordof/architect_woman_4.jpg",
  "v1460644024/wordof/architect_woman_3.jpg",
  "v1460644024/wordof/architect_woman_2.jpg",
  "v1460644023/wordof/architect_woman_1.jpg",
  "v1460644022/wordof/architect_man_11.jpg",
  "v1460644024/wordof/architect_man_10.jpg",
  "v1460644023/wordof/architect_man_9.jpg",
  "v1460644024/wordof/architect_man_8.jpg",
  "v1460644023/wordof/architect_man_7.jpg",
  "v1460644023/wordof/architect_man_6.jpg",
  "v1460644023/wordof/architect_man_5.jpg",
  "v1460644022/wordof/architect_man_4.jpg",
  "v1460644024/wordof/architect_man_3.jpg",
  "v1460644023/wordof/architect_man_2.jpg"
]

Faker::Config.locale = 'fr'

(1..500).each do |i|
  user = User.new
  user.email = 'me' + i.to_s + '@example.com'
  user.password = 'valid_password'
  user.password_confirmation = 'valid_password'
  user.name = Faker::Name.name
  user[:picture] = architects.shuffle.sample
  user.city = ["Brussels", "Ghent", "Antwerp", "Paris"].shuffle.sample
  user.save!

  if i%2 == 0
    Professional.create!(user_id: user.id, specialty_id: Specialty.all.sample.id, languages: ["English", "French"].sample, prof_email: i.to_s + '@company.com', description: Faker::Lorem.sentence(3), phone: Faker::PhoneNumber.phone_number, address: "Rue de Stassart 60, 1050 Ixelles", recommended_by: Faker::Number.between(40, 250))
  end
end

p "#{User.count} users created"

p "#{Professional.count} professionals created"

