# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Member.create!(
  name:  "Jalal Khan",
  email: "jk249997@muhlenberg.edu",
  password:              "inlecnaz",
  password_confirmation: "inlecnaz",
  admin: true,
  activated: true,
  activated_at: Time.zone.now)


Event.create(
  name: "Test Event",
  desc: "This is a test.",
  start_time: Time.zone.now,
  end_time: Time.zone.now)

# 99.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@test.com"
#   password = "password"
#   Member.create!(name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password,
#                activated: true,
#                activated_at: Time.zone.now)
# 
# end