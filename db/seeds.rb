# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'
require 'faker'

counter = 0

puts "💥Deleting previous DB"
FavouriteProject.destroy_all
DirectMessage.destroy_all
Message.destroy_all
ProjectChat.destroy_all
Collaboration.destroy_all
Milestone.destroy_all
Project.destroy_all
User.destroy_all

def budget_generator
  ["no budget", "big budget", "expanses cover", "1000€", "9000€", "from my own pocket", "50€"].sample
end

def location_generator
  [Faker::Address.full_address, "remote"].sample
end



puts "----------------------SEED STARTED----------------------"
puts " \n "
puts "🆕👨‍🦲-- Creating Users"

admin = User.create(email: "admin@artcollabs.com", password: "admin123456", admin: true)
puts "Created admin \n email: #{admin.email}, password: #{admin.password} \n "

dummy1 = User.create(email: "user@artcollabs.com", password: "000000")
puts "Created dummy 1 \n email: #{dummy1.email}, password: #{dummy1.password} \n "

dummy2 = User.create(email: "user2@artcollabs.com", password: "000000")
puts "Created dummy 2 \n email: #{dummy2.email}, password: #{dummy2.password} \n "

puts "------ Creating Felix 🧔"
felix = User.create(email: "felixwor@aol.com", password: "12345678")
puts "Felix created"


10.times do
  User.create(email: "#{Faker::Internet.email}", password: "000000")

end

puts " \n "

# trying to keep felix's code assigning project user and message user to his created user after all users were created. Getting ActiveRecord::AssociationTypeMismatch errors.

# puts "📨📨-- Message system seeds"
# project1 = Project.create(user: User.find(email: "felixwor@aol.com"), title: "Project 1")
# ProjectChat.create(project: project1)
# Message.create(project_chat: project1, user: felix, content: "This is my first message")

puts " \n "
puts "🆕🧾-- Creating Projects"

def name_generator
  ["The end of Osiris", "Pentimento", "Through triple darkness", "Wake up the statues", "symptom, sympathy", "The importance of being self suficient", "Verhandlungsbasis", "false ruins and lost innocence", "Freedom and Independence", "Scene with Perfect Babble", "Absence over Vision", "Kinetic Sunset", "Algorithm purpose", "Sketch of Binary Perception", "Cryonic Suspension May Save Your Life", "Samurai Masu Biitsu", "Spoiler Alert, Everybody is Dying.", "Selvagem", "Darkroom Lover", "Lay me down", "Adelaide's Voyage", "0055444", "TRANSGRESSION", "Heimcomputer", "Axioms", "Cupio dissolvi", "tepeu", "Lento Brutalo", "près du mur", "et j'ai besoin d'un câlin", "resistance de ma bouche", "...hemos hecho", "bezduszny", "kycklingarna har rymt", "harab aldijaj", "talchulhaessda", "I was wrong", "1978", "Intacto", "She's made a choice (and you won't like it.)", "Joints I should have smoked",  "I'm not a crook", "The rent is too damn high", "mathematischen Verhältnissen", "Springbrunnen", "Grosse Nasenlöcher", "Exertion", "Why would anyone do that?", "56600 - The Past. The Future.", "The Goose Feels Happy", "Soul Rythms", "Black Aura - White What?" ]
end

female_side = Project.new(title: "The female side of the moon", description: " THE FEMALE SIDE OF THE MOON pursues the female gaze. But rather than examining what it is and if such a thing ever exists, it wants to render and foster the multiplicity of the looks of women* towards women*. The bodies photographed turn into the cracks of the earth, they witness the restless geographies they arise from. Much of Maple‘s work is inspired by feminism and gender politics. She is interested in the part shame plays in womens’ lives,
be that how they take up space in the world, their physical appearance, their bodily functions or blame culture.
Maple is interested in how we can change the visual narrative for women as a form of empowerment. In much of this work
she uses humor as a Trojan horse to get a message across. Her work crosses a wide variety of media such as performance,
painting and photography. The idea comes first then the medium she chooses
is determined by the strongest way to get the idea across, hence is constantly evolving.", budget: "#{budget_generator}", location: "#{location_generator}", status: "open", max_members: 2, user: dummy1)

female_side.photo.attach(io: File.open("app/assets/images/ph_projects/female_side.jpg", "rb"), filename: "female_side")
female_side.save


puts " \n \n "
sleep(1)
puts "--------------------------------------------"
puts "--------Hope you're having a good day!----- "
puts "--------------------------------------------"
sleep(1)
puts "😁"
sleep(1)
puts " \n \n "


puts " \n "
puts "🆕👯-- Creating Collabs"
puts " \n "

Collaboration.create(project: Project.where(user: dummy1).first, role: "#{Faker::Job.field}", user: dummy2, message: "Baby, can't you see I'm calling? A guy like you should wear a warning - It's dangerous, I'm falling")
puts "Collaboration from dummy 2 on dummy 1 requested"
puts " \n "

Collaboration.create(project: Project.where(user: dummy2).first, role: "#{Faker::Job.field}", user: dummy1, message: "Can't read my, can't read my? No, he can't read my poker face - (She's got me like nobody)")
puts "Collaboration from dummy 1 on dummy 2 requested"
puts " \n "

counter = 0
20.times do
  counter = counter + 1
  collab = Collaboration.create!(project: Project.all.sample, role: "#{Faker::Job.field}", user: User.all.sample, message: "#{Faker::Music::Prince.lyric}")
  puts "Random collab #{counter}: User: #{collab.user.email}, project: #{collab.project.title}"
  puts " \n "
end

puts " \n "
puts "🆕🚩🚩-- Creating Milestones"
puts " \n "

counter = 0
20.times do
  counter = counter + 1
  milestone = Milestone.create!(project: Project.all.sample, title: "#{Faker::Marketing.buzzwords}", description: "Ab his oratores, ab his imperatores ac rerum publicarum principes extiterunt. Quantum Aristoxeni ingenium consumptum videmus in musicis? Qui autem diffidet perpetuitati bonorum suorum, timeat necesse est, ne aliquando amissis illis sit miser. Quo modo autem optimum, si bonum praeterea nullum est? Non minor, inquit, voluptas percipitur ex vilissimis rebus quam ex pretiosissimis. Illum mallem levares, quo optimum atque humanissimum virum, Cn. Aliter enim explicari, quod quaeritur, non potest.", completed: [true, false].sample)
  puts "Random Milestone #{counter}: project: #{milestone.project.title}"
  puts " \n "
end

puts "📨📨-- Message system seeds ..."

new_chatroom = Chatroom.create
new_message = DirectMessage.create(chatroom: Chatroom.last, user: User.last, content: "This is my first silly direct message")

puts "----------------------SEED ENDED----------------------"
