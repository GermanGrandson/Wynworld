
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# User.destroy_all
# Cohort.destroy_all
#
Cohort.create!(
name: 'MIA 1',
location: 'Miami',
graddate: '3/1/2016'
)
Cohort.create!(
name: 'FLL 1',
location: 'Fort Lauderdale',
graddate: '4/1/2016'
)
User.create!(
fname: 'German',
lname: 'Nieto',
email: 'german@example.com',
location: "Fort Lauderdale",
password: 'password',
password_confirmation: 'password',
admin: true,
cohort_id: nil
)
20.times do |n|
User.create!(
fname: Faker::Name.first_name,
lname: Faker::Name.last_name,
email: Faker::Internet.free_email,
location: "Miami",
password: 'password',
password_confirmation: 'password',
cohort_id: 1
)
end
20.times do |n|
User.create!(
fname: Faker::Name.first_name,
lname: Faker::Name.last_name,
email: Faker::Internet.free_email,
location: "Fort Lauderdale",
password: 'password',
password_confirmation: 'password',
cohort_id: 2
)
end

# Company.create!(
# )
# Employment.create!(
# )


p "Created #{User.count} Users"
