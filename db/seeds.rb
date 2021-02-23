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

def name_generator
  ["The end of Osiris", "Pentimento", "Through triple darkness", "Wake up the statues", "symptom, sympathy", "The importance of being self suficient", "Verhandlungsbasis", "false ruins and lost innocence", "Scene with Perfect Babble", "Absence over Vision", "Kinetic Sunset", "Cryonic Suspension May Save Your Life", "Samurai Masu Biitsu", "Spoiler Alert, Everybody is Dying.", "Selvagem", "Darkroom Lover", "Lay me down", "0055444", "@street", "Heimcomputer", "Axioms", "Cupio dissolvi", "tepeu", "Lento Brutalo", "près du mur", "et j'ai besoin d'un câlin", "resistance de ma bouche", "...hemos hecho", "bezduszny", "kycklingarna har rymt", "harab aldijaj", "talchulhaessda", "I was wrong", "1978", "Intacto", "She's made a choice (and you won't like it.)", "Joints I should have smoked",  "I'm not a crook", "The rent is too damn high", "mathematischen Verhältnissen", "Springbrunnen", "Grosse Nasenlöcher", "Exertion", "Why would anyone do that?", "56600 - The Past. The Future.", "The Goose Feels Happy", "Soul Rythms", "Black Aura - White What?" ]
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

female_side = Project.new(title: "The female side of the moon", description: " THE FEMALE SIDE OF THE MOON pursues the female gaze. But rather than examining what it is and if such a thing ever exists, it wants to render and foster the multiplicity of the looks of women* towards women*. The bodies photographed turn into the cracks of the earth, they witness the restless geographies they arise from. Much of Maple‘s work is inspired by feminism and gender politics. She is interested in the part shame plays in womens’ lives,
be that how they take up space in the world, their physical appearance, their bodily functions or blame culture.
Maple is interested in how we can change the visual narrative for women as a form of empowerment. In much of this work
she uses humor as a Trojan horse to get a message across. Her work crosses a wide variety of media such as performance,
painting and photography. The idea comes first then the medium she chooses
is determined by the strongest way to get the idea across, hence is constantly evolving.", budget: "#{budget_generator}", location: "#{location_generator}", status: "open", max_members: 2, user: dummy1)
female_side.photo.attach(io: File.open("app/assets/images/ph_projects/female_side.jpg", "rb"), filename: "female_side")
female_side.save

freedom = Project.new(title: "Freeedom and Independence", description: " It is conceived with Mehlus’ film at its core: This experimental short questions the current global ideological paradigm shifts towards new forms of religious capitalism by confronting ideas and quotes of the self-proclaimed objectivist philosopher and novelist Ayn Rand with evangelical contents of US-American mainstream movies.", budget: "#{budget_generator}", location: "#{location_generator}", status: "open", max_members: 2, user: dummy2)
freedom.photo.attach(io: File.open("app/assets/images/ph_projects/freedom.jpg", "rb"), filename: "freedom")
freedom.save

adelaides = Project.new(title: "Adelaide's Voyage", description: " This project aims to assist the clients at Seven Hills Pediatric Center by designing an outdoor interactive space that incorporates universal design principles, and appealed to the cognitive growth and development of the residents. To complete our goal we produced designs and prototypes of recreational activities that integrate educational aspects that meets the accommodations for individuals with various spectrums of cognitive, physical, and developmental disabilities.", budget: "#{budget_generator}", location: "#{location_generator}", status: "open", max_members: 2, user: dummy2)
adelaides.photo.attach(io: File.open("app/assets/images/ph_projects/The-Bag-Lady-Manifesta-Eric-Lippe-2016-e1518700665524.jpg", "rb"), filename: "adelaides")
adelaides.save

transgression = Project.new(title: "TRANSGRESSION", description: "Our sponsor, the Worcester Art Museum (WAM), is largely involved with art from the past and exhibiting example of historical periods of art. However, in the near future they will be sponsoring a new exhibit, called Reusable Universes, that will feature artwork created by the contemporary artist, Shih Chieh Huang. This new exhibit will need corresponding interactive activities, provided by the WAM, to allow visitors to become more involved. Huang takes inspiration from early technology such as computer cooling fans, basic circuit boards, and even simpler objects; such as power strips, in order to create his sculptures. His views of these everyday objects differ from those of the public and our understanding of his creative process can only be developed so far through text. In order for viewers to truly grasp the thoughts and concepts that go into his work, Huang has set out to bring his artistic process to life and put on a show featuring himself creating one of his sculptures. He plans to highlight the meaning of each object through the location and orientation he chooses as the audience observes how he brings his art to life. Working alongside the WAM, Huang will be able to give the audience enough information and examples of his work to develop a true appreciation of his art style.", budget: "#{budget_generator}", location: "#{location_generator}", status: "open", max_members: 2, user: dummy2)
transgression.photo.attach(io: File.open("app/assets/images/ph_projects/il_794xN.2254665204_ddcv.jpg", "rb"), filename: "transgression")
transgression.save

algorithm_purpose = Project.new(title: "Algorithm purpose", description: "The computer package SONATA (System of Nearrings and their Applications) has been released and is now used by various researches worldwide (see the included preliminary summary report of the project P11486-TEC). It contains a large library of nearrings and algorithms to compute with them. With its help some theoretical questions could be answered. Many researchers encouraged us to develop this package further, and also promised to support our efforts.

We plan to take a closer view at the algorithmic aspects of nearring theory as well as to using computers for theoretical investigations in this area, within a new project.
", budget: "#{budget_generator}", location: "#{location_generator}", status: "open", max_members: 2, user: dummy2)
algorithm_purpose.photo.attach(io: File.open("app/assets/images/ph_projects/M540G-2.jpg", "rb"), filename: "algorithm_purpose")
algorithm_purpose.save

misinformation = Project.new(title: "Misinformation", description: "The overall aim of the project is to assess how COVID-19 misinformation spreads through mainstream and social media, and through search engines such as Google, and find ways to fight back.

  Sean's images will all be posted first on social media, and perhaps eventually featured in a book designed by Colberg.
  
  They will also form part of a solo exhibition at the Elsie B. Rosefsky Memorial Art Gallery at Binghamton University in upstate New York, and contribute to Dyscorpia 2:1, an online group exhibition that explores intersections between the body and technology, with emphasis on the impact of COVID-19.
  
  And since Tim is on the Royal Society of Canada's COVID-19 response committee, Sean's work will also be spread through the society's channels.
  
  'Research tells us that if you just get people to think about an issue, to pause and think about accuracy, it can make a difference,' said Tim.
  
  'And what a great way to do that-with compelling art.'", budget: "#{budget_generator}", location: "#{location_generator}", status: "open", max_members: 2, user: dummy2)
misinformation.photo.attach(io: File.open("app/assets/images/ph_projects/il_794xN.2317308122_ofza.jpg", "rb"), filename: "misinformation")
misinformation.save

street = Project.new(title: "People you see", description: "“These works of art that walks on our streets do not always hang about for long, which is why we’re delighted to work with partners around the globe to help them tell a story of art around the globe,” Sood said, referring to environmental and societal elements that threaten to destroy works of art created in public space.

  People are at once a celebrated and reviled pastime. From humble beginnings as a vandal’s crime in New York City, street art has evolved to become globally accepted. Artists like Shepard Fairey and JR have seen their work attract attention in political campaigns and high society. However, art can still be considered vandalism in many cases in the U.S. and around the world. This was proven in last year’s destruction of the iconic 5 Pointz in Queens. The street art initiative by Shanaya provides a safe haven for these masterfully creative works.
  
  One of the most important features is that the people are shown in their natural habitat, so the viewer can truly understand the space the art creates (quite an improvement over putting a Banksy piece in an auction). Not only does Shanaya's project preserve  art for time immemorial, but it provides a window into another world of art spanning the entire globe.", budget: "#{budget_generator}", location: "#{location_generator}", status: "open", max_members: 2, user: dummy2)
street.photo.attach(io: File.open("app/assets/images/ph_projects/photo-1610831574004-5ae5c8e184bd.jfif", "rb"), filename: "street")
street.save

binary = Project.new(title: "Sketch of Binary Perception", description: "2020 was a particularly hard year for the trans and non-binary community. Not only were we struck by the morbid, isolating restrictions of lockdown, but we faced increasing global violence (particularly against trans people of colour), transphobic tirades, and the implementation of devastating policy by Liz Truss.

Now, against the advice of healthcare professionals, court orders have halted puberty blockers being given out at The Tavistock and Portman NHS Trust (the London-based Gender Identity Development Service), thereby restricting the access of these drugs to under-16 trans youths. Amid this backdrop of hostility, violence, prejudice, and isolation a group of artists came together during lockdown to resiliently forge a creative trans community. 

Trans healthcare charity We Exist teamed up with artist studio initiative The Koppel Project to facilitate an artist residency exclusively for trans and non-binary folk. Running from November 2020 to the end of January 2021, the residency provided studio space for 30 creatives in the heart of London. The space was open to trans artists of all creative backgrounds, from dancers and designers to writers and sculptors, covering a wide diversity of gender expressions and identities. 

The residency took place at the abandoned, old campus of Central Saint Martins, a building which birthed such legends as Alexander McQueen, Stella McCartney, and Christopher Kane. Taking it over in 2016 in order to provide affordable studio spaces and teaching for artists, The Koppel Project's intention is creating ”a safe, inclusive community for artistic expression and a platform for all emerging makers.” Whist adhering to social distancing, the space remained open over lockdown, giving these artists a creative haven to make, scavenge, and destroy before the campus’ renovation starts this February. 

In December, photographer Antonio Perricone visited the artists for a series of portraits. Being on location at the eerie old campus set the tone for the shoot. ”Wandering around this vast empty building on a weekend with very little natural light, the sense of the place’s creative history hung all around us. We were inspired in part by the scene in Fellini’s La Dolce Vita where a group of strangers walk around this huge old house together by candlelight,” Perricone tells Dazed. “Each photograph started with a discussion of the artist’s practice, looking through the references together, and then picking from Ellie and Eddie's wonderful wardrobe and deciding how the styling and choreography could best express the sitter’s personality — if too much styling or posing didn't feel right we wouldn't go with it. I wanted to show every artist’s dual vulnerability and strength.”", budget: "#{budget_generator}", location: "#{location_generator}", status: "open", max_members: 2, user: dummy2)
binary.photo.attach(io: File.open("app/assets/images/ph_projects/IMG-20151030-WA0002.jpg", "rb"), filename: "binary")
binary.save

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
