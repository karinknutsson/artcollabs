# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Project.destroy_all
Collaboration.destroy_all
Milestone.destroy_all
User.destroy_all

puts "----------------------SEED STARTED----------------------"
puts " \n "
puts "🆕👨‍🦲-- Creating Users"

admin = User.create(email: "admin@artcollabs.com", password: "admin123456")
puts "Created admin \n email: #{admin.email}, password: #{admin.password} \n "

dummy1 = User.create(email: "user@artcollabs.com", password: "000000")
puts "Created dummy 1 \n email: #{dummy1.email}, password: #{dummy1.password} \n "

dummy2 = User.create(email: "user2@artcollabs.com", password: "000000")
puts "Created dummy 2 \n email: #{dummy2.email}, password: #{dummy2.password} \n "



