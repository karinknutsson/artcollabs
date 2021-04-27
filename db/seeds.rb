require 'open-uri'
require 'json'
require 'faker'

counter = 0

puts " \n "
puts "💥Deleting previous DB"
puts " \n "

FavouriteProject.destroy_all
DirectMessage.destroy_all
Message.destroy_all
ProjectChat.destroy_all
Collaboration.destroy_all
Milestone.destroy_all
Project.destroy_all
User.destroy_all

@start = Time.now

def milestone_generator
   ["#{Faker::TvShows::TwinPeaks.quote}, what do you think?", " We should do as one said: #{Faker::TvShows::RuPaul.quote} Then we can't be free from the stress of thinking about all the time.", " #{Faker::TvShows::StrangerThings.quote}, What if #{Faker::TvShows::Community.quotes}?", "I believe the best date to deliver this is #{Date.today+rand(10000)}, otherwise we might run out of time.", "Find a #{Faker::Appliance.equipment}.", "We still have to make a #{Faker::ElectricalComponents.electromechanical} in order for the #{Faker::Gender.type} #{Faker::Military.army_rank} at the #{Faker::Mountain.range} to be ready for the #{Faker::Relationship.familial} #{Faker::Science.element} to be at least presentable when we approach the #{Faker::Marketing.buzzwords}", "Prepare the #{Faker::House.furniture} that we can use for the #{Faker::IndustrySegments.sector} whenever we need to share something about it on the internet.", "It's coming! The final day is almost there, we just need to #{Faker::Games::Pokemon.move} the  #{Faker::House.furniture} the week before we share it with the world.", "I just realized that we will have to start from the beggining with #{Faker::Relationship.familial} #{Faker::Science.element} because it has some errors that cannot be resolved.", "Collaborators, the #{Faker::Relationship.familial} #{Faker::Science.element} Institut told us that if we don't have the #{Faker::JapaneseMedia::StudioGhibli.character} ready in a week we won't be able to have it displayed there. The #{role_generator} will have to hurry on that one."].sample
end

@names = ["The end of Osiris", "Pentimento", "Through triple darkness", "false ruins and lost innocence", "Absence over Vision", "Spoiler Alert, Everybody is Dying.", "Darkroom Lover", "0055444", "@street", "Cupio dissolvi", "Smound = Smell + Sound", "I Never Loved Your Mind", "WHY ARE WE MAD?", "Re-encountered.", "harab aldijaj", "A Slightly Curving Place", "Das illegale Bild", "56600 - The Past. The Future.", "生ける光の影", "Music for airports", "Black Aura - White What?" ]

def location_generator
  [Faker::Address.full_address, "remote"].sample
end

def role_generator
 ["Painter", "Model", "Photographer", "MUA", "Musician", "Video Artist", "Sculptor", "Filmmaker", "FX", "Creative Director", "Actor", "Performance Artist", "Digital Artist", "3D artist", "Motion Graphic Artist", "Generative Artist", "Editor", "Writer", "Dancer", "Designer", "Developer", "Animator", "Illustrator", "Fashion Designer", "Colorist", "Set Design", "Singer", "Architect", "Fine Artist", "Tattoo Artist", "Scenographer", "Producer", "Lighting Designer", "Costume Designer", "Stylist", "Sound Designer", "Composer", "Carpenter", "Curator", "Gallery Owner", "Art Historian" ].sample
end

def skill_generator
  ["artist", "curator", "painting", "video art", "sculpture", "make up artist", "stylist", "musician", "performance", "writing", "editing", "film"].sample
end

def interest_generator
  ["art", "visual art", "video art", "art history", "feminism", "interdisciplinary", "gender", "critical theory", "performance", "nature", "politics", "philosophy", "ideology", "identity", "vr", "immersion", "film theory"].sample
end

@avatar_count = -1

def avatar_generator
  avatar = [
  "https://res.cloudinary.com/diucx7fqo/image/upload/v1615395797/a-study-for-a-portrait-of-francis-bacon-ii-ryan-babcock_dzw4d9.jpg",
  "https://res.cloudinary.com/diucx7fqo/image/upload/v1615395701/Lempertz-1052-785-Contemporary-Art-Bjarne-Melgaard-Untitled_tkqlqg.jpg",
  "https://res.cloudinary.com/diucx7fqo/image/upload/v1619536655/adult-baseball-cap-black-t-shirt-1211480-ID12098-900x600_tfpxxh.jpg",
  "https://res.cloudinary.com/diucx7fqo/image/upload/v1619536673/action-adult-blur-620336-ID12049-900x600_tndkfe.jpg",
  "https://res.cloudinary.com/diucx7fqo/image/upload/v1619536681/abstract-art-bright-682025-ID12041-900x600_voqp24.jpg",
  "https://res.cloudinary.com/diucx7fqo/image/upload/v1619536702/Top_Hijab_Images_collection_Muslim_women_Girls_183_-ID180788-900x599_rvjwaq.jpg",
  "https://res.cloudinary.com/diucx7fqo/image/upload/v1619536970/adult-automobile-automotive-839011-ID12089-900x600_et7pfl.jpg",
  "https://res.cloudinary.com/diucx7fqo/image/upload/v1619537033/adult-art-checking-phone-296654-ID12084-900x600_w9e7fq.jpg",
  "https://res.cloudinary.com/diucx7fqo/image/upload/v1619537121/adult-beautiful-cap-1191483-ID12116-900x600_uddjkm.jpg",
  "https://res.cloudinary.com/diucx7fqo/image/upload/v1619537114/adult-beautiful-beautiful-girl-892220-ID12105-900x600_u7pfss.jpg",
  "https://res.cloudinary.com/diucx7fqo/image/upload/v1619537131/adult-beautiful-beauty-1035682-ID12106-900x600_hwneh5.jpg",
  "https://res.cloudinary.com/diucx7fqo/image/upload/v1619537232/adult-close-up-cold-1002406-ID12134-599x900_uj8uot.jpg",
  "https://res.cloudinary.com/diucx7fqo/image/upload/v1619537247/adult-bob-marley-city-1194419-ID12125-900x609_tcg99h.jpg",
  "https://res.cloudinary.com/diucx7fqo/image/upload/v1619537253/adult-beautiful-beauty-1054422-ID12107-900x544_czxbiz.jpg",
  "https://res.cloudinary.com/diucx7fqo/image/upload/v1619537523/backpack-blur-city-1205379-ID12213-900x720_b0zoku.jpg",
  "https://res.cloudinary.com/diucx7fqo/image/upload/v1619537546/blurred-background-close-up-colorful-1229177-ID12278-900x600_zisykg.jpg",
  "https://res.cloudinary.com/diucx7fqo/image/upload/v1619537535/beautiful-beauty-face-1180023-ID12230-900x599_c3vlra.jpg",
  "https://res.cloudinary.com/diucx7fqo/image/upload/v1619537554/bow-tie-eyeglasses-eyewear-173295-ID12287-900x691_gzptyh.jpg",
  "https://res.cloudinary.com/diucx7fqo/image/upload/v1619537634/casual-emotional-facial-expression-1182312-ID12313-900x600_t64xns.jpg",
  "https://res.cloudinary.com/diucx7fqo/image/upload/v1619537715/cigarette-close-up-daytime-963444-ID12320-900x600_ge679g.jpg",
  "https://res.cloudinary.com/diucx7fqo/image/upload/v1619537725/face-facial-hair-fine-looking-614810-ID12346-900x769_coajyh.jpg",
  "https://res.cloudinary.com/diucx7fqo/image/upload/v1619537893/attractive-beautiful-beauty-1147395-ID12408-900x600_ojch6w.jpg",
  "https://res.cloudinary.com/diucx7fqo/image/upload/v1619537882/adult-blur-boardwalk-567459-ID12377-900x601_h7c9vj.jpg",
  "https://res.cloudinary.com/diucx7fqo/image/upload/v1619537904/environment-festival-girl-690729-ID12345-900x600_le89ww.jpg"
  ]
1
  if @avatar_count < avatar.length
    @avatar_count += 1
    avatar[@avatar_count]
  else
    @avatar_count = 0
    avatar[@avatar_count]
  end
end

def tag_generator
  tag_generator_array = []
  tags = %w[ virtual immersive protest museum jointworks otherness vr resistance cognition process collective interactive residency permaculture exhibit identity abstract prints post-truth colonization expressionism socialmedia dialogue media print-making music performance installation spectacle photography perception fakenews style anthropology covid-19 sculpture projection video architecture post-pandemic connectivity community collage cyber drag political gender multidisciplinary interdisciplinary event feminism conceptual experimental audio religion painting accessibility senses emotions psychology high-tech low-fi magic space global local crisis union multiculturalism equality typography homosexuality trans queer dance interpretation masculinity paint colors primitive nature duality philosophy idealism constructivism formalist avant-garde minimal explore movement gestalt imperialist patriarchy exhibition ideological exhibition violence opencall groupshow ]
  tags.push("visual art", "joint works", "video art", "open call", "group show", "public sphere", "digital art", "art history", "art fair")
  4.times do
    tag_generator_array << tags.sample
  end
  tag_generator_array
end

puts "----------------------SEED STARTED----------------------"
puts " \n "
puts "🆕👩‍🦰-- Creating Users"
puts " \n "

admin = User.create(email: "admin@artcollabs.com", password: "admin123456", admin: true, username: "artcollabs_admin")
puts "Created admin 🔧 \n email: #{admin.email}, password: #{admin.password} \n "

dummy1 = User.create(email: "user@artcollabs.com", password: "123456", username: "Valerian", first_name: "John Valerian", last_name: "Seymor", location: "San Fransisco",
                     bio: "John Valerian Seymor was born in Argentina and currently lives in San Francisco, California. He graduated from UC Berkeley and received a scholarship to SF Academy of Art. His art reflects his interest in travel and culture. He juxtaposes elements of reality with surrealism using paint, charcoal, and digital art. His rhythmic compositions convey feelings of whimsy with elements of surprise. In addition to original works of art John offers limited edition prints on archival, museum quality paper. His art is sold through many interior designers and art consultants. John’s many exhibitions include those held at the San Diego Art Museum and at the Ace Academy in San Francisco. He won an Award of Excellence in “Artists for Peace” presented by Manhattan Arts International. His art is found in many private collections in the U.S. and several public collections namely the Horace Bank and Dudley Insurance Co., both in California.")
image = URI.open(avatar_generator)
dummy1.avatar.attach(io: image, filename: "dummy1", content_type: "image/png")
dummy1.interest_list.add("digital art", "surrealism", "visual art")
dummy1.skill_list.add("painting", "#{skill_generator}")
dummy1.save
Link.new(user: dummy1, title: "Portfolio", url: "https://www").save
Link.new(user: dummy1, title: "Instagram", url: "https://www").save
Link.new(user: dummy1, title: "Youtube", url: "https://www").save
puts "Created dummy 1 🤡 \n email: #{dummy1.email}, password: #{dummy1.password} \n "

dummy2 = User.create(email: "user2@artcollabs.com", password: "123456", username: "saturn", first_name: "Sara", last_name: "Aviam", location: "Miami",
                     bio: "Sara was born in Ra’anana, Israel. From an early age she demonstrated an innate artistic talent and continued to bring her creative passion to fruition. In 1999 she moved to New York where she pursued an art education at the School of Visual Arts and The Art Students League. In 2019, she moved to Miami, Florida where she currently resides. Sara expresses  joie de vivre in her stylized inspirational portraits and nature scenes. She communicates the healing power of art and lifts our spirits. Her art has been selected for exhibitions presented by the National Association of Women Artists, a prestigious New York-based organization. They have been held at the Coral Springs Museum of Art, in Florida, and Sylvia Wald and Po Kim Art Gallery in New York City, NY. She has also shown her artwork at Armory Annex Gallery, Lake Worth, Florida, and Haven Art Studio, Port Washington, NY, among other venues." )
image = URI.open(avatar_generator)
dummy2.avatar.attach(io: image, filename: "dummy2", content_type: "image/png")
dummy2.interest_list.add("visual art", "portraiture", "philosophy")
dummy2.skill_list.add("portraits", "landscape", "nature", "painting", "drawing")
dummy2.save
Link.new(user: dummy2, title: "Portfolio", url: "https://www").save
Link.new(user: dummy2, title: "Instagram", url: "https://www").save
Link.new(user: dummy2, title: "Youtube", url: "https://www").save
puts "Created dummy 2 👺 \n email: #{dummy2.email}, password: #{dummy2.password} \n "


winkelhalle = User.create(email: "winkelhalle@email.com", password: "123456", username: "WINKELHALLE", location: "Berlin",
                         bio: "winkelhalle’s purpose is to create a space for artistic expression, conversation, learning and engagement. Through our various formats and by showcasing local and emerging artists, we seek to establish a dialogue and cultural exchange within the neighbourhood and the wider Neukölln/Berlin community.
                         By exploring alternative modes of cultural production, artistic expression, discourse and connection we aim to question prevailing modes of practice within the art world, which are characterized by precarity, lack of accessibility and a constant risk of capitalist subsumption. Instead we seek to foster networks of mutual care and creative exchange within our neighbourhood and beyond. We strive to position ourselves as a recognisable, positive force in the (creative) community, creating meaningful exchange and connection for all involved.")
image = URI.open("https://res.cloudinary.com/diucx7fqo/image/upload/v1615297412/winkelhalle_ujjvqg.jpg")
winkelhalle.avatar.attach(io: image, filename: "winkelhalle", content_type: "image/png")
winkelhalle.interest_list.add("visual art", "conceptual art", "performance", "local artists", "emerging artists")
winkelhalle.skill_list.add("exhibitions", "curating", "curator", "gallery")
winkelhalle.save

puts "---- Created Winkelhalle \n email: #{winkelhalle.email}, password: #{winkelhalle.password} \n "

gh93 = User.create(email: "gh93@email.com", password: "123456", username: "G93", first_name: "Galerie", last_name: "GH93", location: "Berlin",
                   bio: "Galerie gh93 began in 2011 with space in need for a multi-disciplinary artist group from Berlin’s WideScope Collective (K.Mutant and Berlin based community)  http://widescopecollective.de/
                   Since the winter of 2012, the space and community has developed and morphed with the same goals in mind. “Pushing magnetism, thought and enjoyment to and through people via art, positive social interaction and music. Along with the realization of tools and technical platform for related aesthetics, interaction and commerce.
                   Previously gh93 has mostly been utilized  as a modern art Gallery and experiencing different curators, gallerists, artists of all mediums and students. In between and at times, gh93 has been rented out or utilized for other purposes: Atellier, Recording Studio, Fashion Showroom, Photography Studio, Mini Theater, Performance Venue, Event Bar, Jewelery Store and other artistic art, craft or creative endeavors.
                   Today gh93 is the private music, technical and artistic atelier from AAtics. And at times inviting other musicians, producers, artists, curators, technologists, architects and philosophers for private high level interactions for future presentations..
                   gh93 is located in Berlin Mitte, in the heart of the art district on the Grosse Hamburger Str.
                   We hope to look forward to communicating with you personally.")
image = URI.open("https://res.cloudinary.com/diucx7fqo/image/upload/v1615305297/gh93logo_p4irls.png")
gh93.avatar.attach(io: image, filename: "gh36", content_type: "image/png")
gh93.save

puts "---- Created gh93 \n email: #{gh93.email}, password: #{gh93.password} \n "

amanda_burke = User.create(email: "amanda@email.com", password: "123456", username: "amandaburke", first_name: "Amanda", last_name: "Burke", location: "Winnipeg",
                            bio: "Amanda Burke is an independent curator based in Winnipeg. She holds an MFA in art history and curatorial practice from York University in Toronto. Her undergraduate degree is in history and art history, from the University of Winnipeg. In 2009-10 Western was Aboriginal Curator-in-Residence at Winnipeg’s Plug In Institute of Contemporary Art and Urban Shaman Contemporary Aboriginal Art Gallery. She currently works as collections coordinator at the University of Manitoba. Some of her recent exhibitions include co-curatorial projects Hovercraft, at the Art Gallery of Southwestern Manitoba, in Brandon; The Ephemerals: Trending, for Gallery 1C03 in Winnipeg; and Close Encounters: The Next 500 Years, for Plug In ICA.")
image = URI.open("https://res.cloudinary.com/diucx7fqo/image/upload/v1619538478/amanda_y0rybf.jpg")
amanda_burke.avatar.attach(io: image, filename: "amanda_burke", content_type: "image/png")
amanda_burke.interest_list.add("aboriginal art", "conceptual art", "video", "performance")
amanda_burke.skill_list.add("curator", "curator-in-residence", "coordinator", "art history")
amanda_burke.save
Link.new(user: amanda_burke, title: "Portfolio", url: "https://www.amandaburke.com").save
Link.new(user: amanda_burke, title: "Instagram", url: "https://www.instagram.com/amanda____burke").save
Link.new(user: amanda_burke, title: "Linked In", url: "https://www.linkedincom/amanda").save

puts "---- Created Amanda 💄 \n email: #{amanda_burke.email}, password: #{amanda_burke.password} \n "

gabi = User.create(email: "gabi@email.com", password: "123456", username: "Gabi", first_name: "Gabrielle", last_name: "Kinzinger", location: "Milan",
                   bio: "Gabi’s work engages with everyday magical transformations emerging within the intersections between nature and technology. Her work is presented through the mediums of film and moving image, photography, painting, digital drawing, and installation. Framing her perspective from a feminist viewpoint, she often features psychic and spiritual aspects of lived experience, as her films meditate on the impact techno-capitalist acceleration exerts upon ephemeral life and living in the world." )
image = URI.open("https://res.cloudinary.com/diucx7fqo/image/upload/v1615379995/gabrielle_y7iohr.jpg")
gabi.avatar.attach(io: image, filename: "gabi", content_type: "image/png")
gabi.interest_list.add("feminism", "magic", "occult", "film")
gabi.skill_list.add("photography", "painting", "writing", "editing", "perception theory")
gabi.save
Link.new(user: gabi, title: "Portfolio", url: "https://www").save
Link.new(user: gabi, title: "Instagram", url: "https://www").save
Link.new(user: gabi, title: "Youtube", url: "https://www").save

puts "---- Created Gabrielle 🍄 \n email: #{gabi.email}, password: #{gabi.password} \n "

miles = User.create(email: "miles@email.com", password: "123456", username: "Milo", first_name: "Miles", last_name: "Davenport", location: "London",
                    bio: "Miles Davenport is the Frick’s Deputy Director and Peter Jay Sharp Chief Curator. A noted scholar of Paolo Veronese, he curated the monographic exhibition on the artist at the National Gallery, London (2014). Previously, Davenport was Curator in the Department of European Paintings at the Metropolitan Museum of Art and, before that, the Arturo and Holly Melosi Chief Curator at Dulwich Picture Gallery, where he curated Van Dyck in Sicily, 1624–25: Painting and the Plague (2012) and collaborated with Nicholas Cullinan on Twombly and Poussin: Arcadian Painters (2011). As an Andrew W. Mellon Curatorial Fellow at the Frick (2004–6), he curated Veronese's Allegories: Virtue, Love, and Exploration in Renaissance Venice (2006). Davenport’s other exhibitions for the Frick include Cagnacci’s Repentant Magdalene: An Italian Baroque Masterpiece from the Norton Simon Museum (2016–17), Veronese in Murano: Two Venetian Renaissance Masterpieces Restored (2017–18), Murillo: The Self-Portraits (2017–18), Canova’s George Washington (2018), Tiepolo in Milan: The Lost Frescoes of Palazzo Archinto (2019), and (with Aimee Ng and Alexander Noelle) Bertoldo di Giovanni: The Renaissance of Sculpture in Medici Florence (2019–20). Davenport received his Ph.D. on the patronage of Cardinal Pietro Aldobrandini from the Courtauld Institute of Art. He has published in Apollo, The Burlington Magazine, Master Drawings, The Medal, The Art Newspaper, Journal of the History of Collections, and The Metropolitan Museum of Art Journal. Davenport also wrote (with Maira Kalman) the latest volume in the Frick Diptych series, Rembrandt’s Polish Rider (2019). He is a trustee and a member of the Projects Committee of Save Venice. In 2018, Italy named Davenport Cavaliere dell’Ordine della Stella d’Italia.")
image = URI.open("https://res.cloudinary.com/diucx7fqo/image/upload/v1615378459/miles_avvh2z.jpg")
miles.avatar.attach(io: image, filename: "miles", content_type: "image/png")
miles.skill_list.add("coordinator", "creative director", "curator")
miles.save
Link.new(user: miles, title: "Portfolio", url: "https://www.miles.com").save
Link.new(user: miles, title: "Linked In", url: "https://www.linkedincom/miles").save
Link.new(user: miles, title: "Artconnect", url: "https://artconnect.com/miles").save

puts "---- Created Miles 👔 \n email: #{miles.email}, password: #{miles.password} \n "

serge = User.create(email: "serge@email.com", password: "123456", username: "jesuisserge", first_name: "Serge", last_name: "Labarte",
                    bio: "As an artist, art historian, curator and exhibition producer, Serge has been involved in art all his life. Areas of special interest include art as it intersects with science, social issues, and multiple disciplines.
                    Serge Labarte is an independent curator and writes art reviews and essays for two blogs. Prior to developing his business as an independent curator, Serge Labarte served as Director of Exhibitions at Sebastopol Center for the Arts from 2000 to 2011. During that time he managed the exhibitions programs which included juried, curated and invitational exhibitions, featuring the work of regional, California, and national artists. The exhibitions were often augmented with lectures, panel discussions, workshops, and interdisciplinary events. Select exhibition highlights include; Circles, Clouds, Magma & Waves—work by Ned Kahn (2004); Giri: Celebrating Japanese Style, Tradition and Culture (2005); Particles in Motion (2006); Beyond Pond Farm—The Legacy of Marguerite Wildenhain (2007);  Alchemy of ReUse—the Art of the ReCycled, ReUsed, ReImagined (2008); Vortex—Art, Matter & Motion (2008); Classic Art of Stanley Mouse (2010);  Form & Finish: Sculptures by Michael Cooper & John de Marchi; Petaluma Arts Center (2014); Sym.bi.osis: Art & Science Intersect, Santa Rosa Junior College, Art Gallery (2014); Cast, Forged & Welded: MetalWorks; Petaluma Arts Center, (2016).")
image = URI.open("https://res.cloudinary.com/diucx7fqo/image/upload/v1615311770/serge_vijvbq.jpg")
serge.avatar.attach(io: image, filename: "serge", content_type: "image/png")
serge.interest_list.add("post idea", "video", "perception", "dark matter")
serge.skill_list.add("artist", "art historian", "writer", "curator")
serge.save
Link.new(user: serge, title: "Portfolio", url: "https://www.serge.com").save
Link.new(user: serge, title: "Instagram", url: "https://www.instagram.com/serge").save
Link.new(user: serge, title: "Linked In", url: "https://www.linkedincom/serge").save
Link.new(user: serge, title: "The-Dots", url: "https://www.thdots.com/serge").save
Link.new(user: serge, title: "Artconnect", url: "https://artconnect.com/serge").save

puts "---- Created Serge 🍸 \n email: #{serge.email}, password: #{serge.password} \n "

puts " \n "
puts "Creating random users... 🥱☕️"
puts " \n "

random_users = [dummy1, dummy2, gh93, amanda_burke, serge, miles, gabi]

counter = 0
20.times do
  counter += 1
  random_user = User.create(email: "#{Faker::Internet.email}", password: "123456", username: "#{Faker::Internet.username}",
                            first_name: "#{Faker::Name.first_name}", last_name: "#{Faker::Name.last_name}")
  image = URI.open(avatar_generator)
  random_user.avatar.attach(io: image, filename: "random_user#{counter}", content_type: "image/png")
  random_user.bio = "#{random_user.first_name} #{random_user.last_name} is an artist who works in a variety of media. By applying abstraction, #{random_user.first_name} makes work that deals with the documentation of events and the question of how they can be presented. The work tries to express this with the help of physics and technology, but not by telling a story or creating a metaphor.Their artworks doesn’t reference recognisable form. The results are deconstructed to the extent that meaning is shifted and possible interpretation becomes multifaceted. With Plato’s allegory of the cave in mind, they try to increase the dynamic between audience and author by objectifying emotions and investigating the duality that develops through different interpretations. Their works are an investigation into representations of (seemingly) concrete ages and situations as well as depictions and ideas that can only be realized in art."
  random_user.interest_list.add("#{interest_generator}", "#{interest_generator}", "#{interest_generator}", "#{interest_generator}")
  random_user.skill_list.add("#{skill_generator}", "#{skill_generator}", "#{skill_generator}", "#{skill_generator}", "#{skill_generator}")
  random_user.save
  Link.new(user: random_user, title: "Portfolio", url: "https://www").save
  Link.new(user: random_user, title: "Linked In", url: "https://www").save
  Link.new(user: random_user, title: "Instagram", url: "https://www").save
  random_users << random_user
end

puts "Created #{random_users.length} random users 🥳"
puts " \n "
puts " \n "

puts "🆕🧾-- Creating Projects"

puts " \n "
puts "Creating random projects ⏳"

counter = 0

@names.each do |name|
  random_project = Project.new(user: random_users.sample, title: name,
                              description: "The indexical and acyclic text synthesis marginalises and immerses the artist collective. It marginalises unveiled, mechanic text syntheses from various acyclic artist collectives. It is at this point that the text synthesis emancipates and substantiates the characteristic, unveiled logo. Sometimes an emancipating net culture marginalises fictive and habitual catalogues. The list of fictive segments immerses and emancipates the acyclic, projective occupancy."
                              status: "open", max_members: 2, start_date: Date.today+rand(1000), end_date: Date.today+rand(10000))
  random_project.location = random_project.user.location
  image = URI.open("https://source.unsplash.com/random")
  random_project.photo.attach(io: image, filename: "name", content_type: "image/png")
  random_project.tag_list = tag_generator
  random_project.save
end

puts " \n "
puts "Created #{@names.length.to_s} random projects 🙌"

puts " \n "
puts "Creating curated projects ✨"


transgression = Project.new(title: "TRANSGRESSION", description: "Our sponsor, the Worcester Art Museum (WAM), is largely involved with art from the past and exhibiting example of historical periods of art. However, in the near future they will be sponsoring a new exhibit, called Reusable Universes, that will feature artwork created by the contemporary artist, Shih Chieh Huang. This new exhibit will need corresponding interactive activities, provided by the WAM, to allow visitors to become more involved. Huang takes inspiration from early technology such as computer cooling fans, basic circuit boards, and even simpler objects; such as power strips, in order to create his sculptures. His views of these everyday objects differ from those of the public and our understanding of his creative process can only be developed so far through text. In order for viewers to truly grasp the thoughts and concepts that go into his work, Huang has set out to bring his artistic process to life and put on a show featuring himself creating one of his sculptures. He plans to highlight the meaning of each object through the location and orientation he chooses as the audience observes how he brings his art to life. Working alongside the WAM, Huang will be able to give the audience enough information and examples of his work to develop a true appreciation of his art style.",
                            status: "open", max_members: 2, user: dummy2, start_date: Date.today, end_date: Date.today+rand(10000))

transgression.tag_list = %w[ rebel installation jointworks collage ]
transgression.save

future = Project.new(title: "Future Spaces of Cohabitation",
                      description: "Designers, architects and urban planners are increasingly taking on the task of managing social and political issues of relationships, neighborhoods, energy flows, mobility, cultural heritage, identity and urban change, rather than just spatial and formal aspects. The theme ‘Landscapes of care’ focuses on a change of direction in the values, interests and priorities that drive architecture and urban planning. The main focus changes from the individual actor or the individual object, towards a greater sensitivity to issues of interconnection, attachment and interdependence. Questions about how we live well together peacefully in diversity and with respect for each other's differences are pressing on in several contexts. Inequality manifests in physical spaces as it’s not the same to be locked down in minimum space housing than in open residential spaces. In the same line, at urban scale in vulnerable public housing areas residents must vacate their communal areas on the basis of criteria to which privately owned residential areas and their residents are not subjected. Other examples are the existing zoning ban for homeless and other marginalized street residents, proposed zoning bans for ‘insecurity-creating’ stays in public spaces linked to gender and ethnicity, the design and regulation of camps for refugees and asylum seekers, etc. The community and its spatial expression have been put up for debate these years. Can architecture and urban development contribute concretely to facilitate safe mobility and equality in urban space? How can architecture and urban planning support people in precarious life situations and provide space for minorities? How do we take care of creating a safe, open city and inclusive public spaces at a time when many (new voices) express that they feel underrepresented and discriminated against every day, e.g. in the institutions' structures, public spaces and discourses about affiliation, homes, norms of behavior and policies?"
                      status: "open", max_members: 2, user: random_users.sample, start_date: Date.today, end_date: Date.today+rand(10000))
future.location = future.user.location
image = URI.open("https://res.cloudinary.com/diucx7fqo/image/upload/v1619542646/BladeRunner-City5-1920x1080_a6qvsp.jpg")
future.photo.attach(io: image, filename: "future", content:_type: "image/png")
future.tag_list = %w[ architechture design installation ]
future.save

misinformation = Project.new(title: "Misinformation",
                             description: "The overall aim of the project is to assess how COVID-19 misinformation spreads through mainstream and social media, and through search engines such as Google, and find ways to fight back. Our images will all be posted first on social media, and perhaps eventually featured in a book designed by Colberg. They will also form part of a solo exhibition at the Elsie B. Rosefsky Memorial Art Gallery at Binghamton University in upstate New York, and contribute to Dyscorpia 2:1, an online group exhibition that explores intersections between the body and technology, with emphasis on the impact of COVID-19. Our work will also be spread through the society's channels. 'Research tells us that if you just get people to think about an issue, to pause and think about accuracy, it can make a difference. And what a great way to do that-with compelling art.'",
                             status: "open", max_members: 2, user: random_users.sample, start_date: Date.today, end_date: Date.today+rand(10000))
misinformation.location = misinformation.user.location
image = URI.open("https://res.cloudinary.com/diucx7fqo/image/upload/v1619542959/misinfo_qmudgv.jpg")
misinformation.photo.attach(io: image, filename: "misinfo", content:_type: "image/png")
misinformation.tag_list = %w[ covid19 sculpture fakenews socialmedia ]
misinformation.save

street = Project.new(title: "People you see",
                     description: "These works of art that walks on our streets do not always hang about for long, which is why we’re delighted to work with partners around the globe to help them tell a story of art around the globe,” Sood said, referring to environmental and societal elements that threaten to destroy works of art created in public space. People are at once a celebrated and reviled pastime. From humble beginnings as a vandal’s crime in New York City, street art has evolved to become globally accepted. Artists like Shepard Fairey and JR have seen their work attract attention in political campaigns and high society. However, art can still be considered vandalism in many cases in the U.S. and around the world. This was proven in last year’s destruction of the iconic 5 Pointz in Queens. The street art initiative by Shanaya provides a safe haven for these masterfully creative works. One of the most important features is that the people are shown in their natural habitat, so the viewer can truly understand the space the art creates (quite an improvement over putting a Banksy piece in an auction). Not only does Shanaya's project preserve  art for time immemorial, but it provides a window into another world of art spanning the entire globe."
                     status: "open", max_members: 2, user: dummy1, start_date: Date.today, end_date: Date.today+rand(10000))
image = URI.open("https://res.cloudinary.com/diucx7fqo/image/upload/v1615393011/people_ujf3p2.jpg")
street.photo.attach(io: image, filename: "street", content_type: "image/png")
street.tag_list = %w[ photography style anthropology urban ]
street.save

kinetic_sunset = Project.new(title: "Kinetic Sunset", description: "We're looking for Photographers who are into night city Photography to create a series of collages. Our biggest inspiration are neon lights, frequently used in busy streets of China.",
                              status: "open", max_members: 2, user: random_users.sample, start_date: Date.today, end_date: Date.today+rand(10000))
kinetic_sunset.location = kinetic_sunset.user.location
image = URI.open("https://res.cloudinary.com/diucx7fqo/image/upload/v1619543175/city_neon_lights01844_vudip0.jpg")
kinetic_sunset.photo.attach(io: image, filename: "kinetic", content_type: "image/png")
kinetic_sunset.tag_list = %w[ photography collage cityscape dualism ]
kinetic_sunset.save

symptom = Project.new(title: "symptom, sympathy", description: "After extensive research about upbringing of Children during and after the Nazi-Regime, we're looking for artists to collaborate on a project about the physical consequences that lack of emotional connection and rigid upbringing brings to an formed adult.",
                      status: "open", max_members: 2, user: random_users.sample, start_date: Date.today, end_date: Date.today+rand(10000))
image = URI.open("https://res.cloudinary.com/diucx7fqo/image/upload/v1619543326/Devostock_Eloy_District_Pinal_County_75_y6yrjk.jpg")
symptom.photo.attach(io: image, filename: "symptom", content_type: "image/png")
symptom.tag_list = %w[ painting psychology authoritarism ]
symptom.save

algorithm_purpose = Project.new(title: "Algorithm purpose",
                                description: "The computer package SONATA (System of Nearrings and their Applications) has been released and is now used by various researches worldwide (see the included preliminary summary report of the project P11486-TEC). It contains a large library of nearrings and algorithms to compute with them. With its help some theoretical questions could be answered. Many researchers encouraged us to develop this package further, and also promised to support our efforts.We plan to take a closer view at the algorithmic aspects of nearring theory as well as to using computers for theoretical investigations in this area, within a new project.",
                                status: "open", max_members: 2, user: miles, start_date: Date.today, end_date: Date.today+rand(10000))
image = URI.open("https://res.cloudinary.com/diucx7fqo/image/upload/v1619543505/Devostock_Codes_Computer_Keyboard_1933900_4k_unwfvy.jpg")
algorithm_purpose.photo.attach(io: image, filename: "algorithm", content_type: "image/png")
algorithm_purpose.tag_list = %w[ technology math performance music ]
algorithm_purpose.save

holly_daze = Project.new(user: gh93, title: "Group Exhibition - Holly Daze",
                         start_date: Date.parse('01-11-2021'),
                         end_date: Date.parse('18-12-2021'),
                         location: gh93.location,
                         description: "Holly Daze. Group XhibisMus Special. A good time for giving thanks for the tranquility given by the ethics of nature and giving of gifts anonymously or in genuine form.
                                       The Holly Daze group exhibition brings together 13 positive local exploring Berlin artists which naturally form over time with relative spontaneous interaction.
                                       This Friday, December 6th, from 15uhr-23uhr - art, music, drinks and sweets are available to the public for the opening and viewing of the artists works, reading materials, discussions at the PhiloBar, checking out Rudi and perhaps finding a gift that fits one's self or other's collections, good feelings and personal specialties.
                                       Over the 3 weeks, artists will be in the Gallery at varied times with schedule to come for your further curiosities.")
image = URI.open("https://res.cloudinary.com/diucx7fqo/image/upload/v1615305840/78685619_2910024119091319_7364869907541917696_o_b5jzqb.jpg")
holly_daze.photo.attach(io: image, filename: "holly_daze", content_type: "image/png")
holly_daze.tag_list = %w[ Berlin opencall gh93 exhibition ]
holly_daze.save

red_twilight = Project.new(title: "Red Twilight", user: random_users.sample, start_date: Date.parse('01-05-2021'), end_date: Date.parse('01-07-2021'),
                           description: "I always loved watching my sister applying make-up in the morning, that calmness on her face while contouring her lips dark red like all the Yugo girls did. These were the early 90ies and St. Linda Evangelista was watching the scenery from a torn-out magazine page my sister had stuck to the wall. I tried to make her laugh but she was too focused and just poked me in the arm without looking away from the mirror. There was a ­petrol station near our house to which she would send me to buy red Gauloises for her and sweets for myself. In those mornings we would talk and wonder why things had turned out to be that difficult while she was smoking and drinking coffee from her metal Thermos jug until she left for work always in a hurry.")
image = URI.open("https://res.cloudinary.com/diucx7fqo/image/upload/v1615384076/Screenshot_2021-03-10_at_14.32.48_wdladq.png")
red_twilight.photo.attach(io: image, filename: "red_twilight", content_type: "image/png")
red_twilight.tag_list = %w[ memory origin space time ]
red_twilight.save

little_frank = Project.new(title: "Little Frank Studies", description: "Fraser was born in Billings, Montana and grew up in Berkeley, California. She attended New York University, the Whitney Museum of American Art's Independent Study Program, and the School of Visual Arts. Fraser worked as a gallery attendant at Dia:Chelsea. Fraser began writing art criticism before incorporating a similar analysis into her artistic practice. Her videotape performance Little Frank and His Carp (2001), shot with five hidden cameras in the atrium of the Guggenheim Museum Bilbao, targets architectural dominance of modern gallery spaces. Using the original soundtrack of an acoustic guide at the Guggenheim Museum Bilbao, she '... writhes with pleasure as the recorded voice draws attention to the undulating curves and textured surfaces of the surrounding space' which she takes literally in an 'erotic encounter'. Fraser's sexual display towards the architecture reveals the irony of the erotic words used on the audio tour to describe the museum's structure. The plan is to analyze the content of the architectural pieces used by Fraser and gather our own views on her project in order to reproduce the concept in a Virtual Ambient",
                           status: "open", max_members: 2, user: random_users.sample, start_date: Date.today, end_date: Date.today+rand(10000))
image = URI.open("https://res.cloudinary.com/diucx7fqo/image/upload/v1619543610/frank_m943dj.jpg")
little_frank.photo.attach(io: image, filename: "little_frank", content_type: "image/png")
little_frank.tag_list = %w[ performance installation architecture museum ]
little_frank.save

tehran = Project.new(title: "Tehran Contemporary Sounds Festival", user: random_users.sample, location: "Berlin", start_date: Date.parse('05-07-2021'), end_date: Date.parse('18-07-2021'),
                     description: "Tehran Contemporary Sounds was launched in 2018, through the organization of “Gate of Tehran – Days of Experimental Sounds” festival as a Berlin-based hub, for musicians, artists and collectives living abroad as well as in Iran, with the aim to bring together the different voices and forces of the big spectrum of the Iranian contemporary art and music scene, widely spread across the globe.
                     TCS will be dedicated to, creating a platform for showcasing the unique talents of the Iranian artists and musicians; creating a cross-border collaboration hub; facilitating a non-political, purely artistic and interdisciplinary dialogue;
                     This year, Tehran Contemporary Sounds Festival, in collaboration with Nullsight collective and Zabte Sote label, is bringing together some of the most important talents of the contemporary Iranian electronic/experimental sound artists and musicians, and digital and new media artists.
                     In the three days of the festival we’ll have a special showcase of the Zabte Sote artists. An exhibition run by Nullsight collective and a daily number of 6 audio visual performances in Kunstquartier Bethanien Studio 1.")
image = URI.open("https://res.cloudinary.com/diucx7fqo/image/upload/v1615388410/75093790_693570871136048_6525617299150340096_o_jgjtlz.jpg")
tehran.photo.attach(io: image, filename: "tehran", content_type: "image/png")
tehran.tag_list = %w[ tehran iran music contemporary ]
tehran.save

hugged = Project.new(title: "hugged in a kind yet misterious mist", user: random_users.sample, start_date: Date.parse('05-09-2021'), end_date: Date.parse('18-09-2021'),
                     description: "We make conceptual artworks, photos, drawings and installations. By studying sign processes, signification and communication, we make work that generates diverse meanings. Associations and meanings collide. Space becomes time and language becomes image. Our conceptual artworks feature coincidental, accidental and unexpected connections which make it possible to revise art history and, even better, to complement it. Combining unrelated aspects lead to surprising analogies. By manipulating the viewer to create confusion, we often create several practically identical works, upon which thoughts that have apparently just been developed are manifested: notes are made and then crossed out again, ‘mistakes’ are repeated. Our works question the conditions of appearance of an image in the context of contemporary visual culture in which images, representations and ideas normally function. By experimenting with aleatoric processes, we formalize the coincidental and emphasizes the conscious process of composition that is behind the seemingly random works. The thought processes, which are supposedly private, highly subjective and unfiltered in their references to dream worlds, are frequently revealed as assemblages. Our works are on the one hand touchingly beautiful, on the other hand painfully attractive. Again and again, the artists leave us orphaned with a mix of conflicting feelings and thoughts.")
image = URI.open("https://res.cloudinary.com/diucx7fqo/image/upload/v1615569074/Screenshot_2021-03-12_at_18.09.30_j0wwhb.png")
hugged.photo.attach(io: image, filename: "hugged", content_type: "image/png")
hugged.tag_list = %w[ installation conceptual signifyer sign ]
hugged.save

the_ephemerals = Project.new(user: amanda_burke, title: "The Ephemerals: Trending",
                             start_date: Date.parse('05-04-2021'),
                             end_date: Date.parse('05-06-2021'),
                             description: "In online social networking sites, the concept of 'trending' demarcates a noted increase in the popularity of a specific thing or topic among a large group of internet users. In the wider world, a fashion trend indicates an upward shift of interest in a particular style or mode of dress by a number of people. A recent trend that has found its way into runway shows and suburban malls alike is an Indigenously-inspired look involving apparel such as leather mukluks, beaded headbands and feathered accessories. Clothing remains an important element within an Aboriginal art history as well as in contemporary creative culture where questions of appropriation and freedom of expression are beginning to erupt around this issue.")
image = URI.open("https://res.cloudinary.com/diucx7fqo/image/upload/v1615304115/103680649_10157460668107879_3771724203750008978_o_s8cmyd.jpg")
the_ephemerals.photo.attach(io: image, filename: "the_ephemerals", content_type: "image/png")
the_ephemerals.tag_list = %w[ aboriginal woman indiginous origin ]
the_ephemerals.save

female_side = Project.new(title: "The female side of the moon",
                          description: "THE FEMALE SIDE OF THE MOON pursues the female gaze. But rather than examining what it is and if such a thing ever exists, it wants to render and foster the multiplicity of the looks of women* towards women*. The bodies photographed turn into the cracks of the earth, they witness the restless geographies they arise from. Much of Maple‘s work is inspired by feminism and gender politics. She is interested in the part shame plays in womens’ lives, be that how they take up space in the world, their physical appearance, their bodily functions or blame culture. Maple is interested in how we can change the visual narrative for women as a form of empowerment. In much of this work she uses humor as a Trojan horse to get a message across. Her work crosses a wide variety of media such as performance, painting and photography. The idea comes first then the medium she chooses is determined by the strongest way to get the idea across, hence is constantly evolving.",
                          status: "open", max_members: 2, user: gabi, start_date: Date.today, end_date: Date.today+rand(10000))
image = URI.open("https://res.cloudinary.com/diucx7fqo/image/upload/v1619543925/_Mistress_of_the_Night__krvhz7.jpg")
female_side.photo.attach(io: image, filename: "female_side", content_type: "image/png")
female_side.tag_list = %w[ gender photography painting performance ]
female_side.save

folklore = Project.new(user: serge, title: "Folklore and traditions",
                         start_date: Date.parse('01-08-2021'),
                         end_date: Date.parse('30-08-2021'),
                         location: serge.location,
                         description: "Pictures cannot be considered to be merely documents. They are also able to capture, preserve, interpret and reinvent occurrences, situations, places that are progressively disappearing or - on the contrary - still surviving, like folklore and traditions. This call aims to collect photographs that are capable of catching the essence, the traditional part of our society - e.g. agricultural objects that are not in use anymore, practices or celebrations, folkloristic costumes, ethnic museums and collections. In other words, everything reminding us of our roots, of the most genuine side of the society we live in.")
image = URI.open("https://res.cloudinary.com/diucx7fqo/image/upload/v1615315345/folklore_njkedb.jpg")
folklore.photo.attach(io: image, filename: "folklore", content_type: "image/png")
folklore.tag_list = [ "opencall", "open call", "group show", "exhibition" ]
folklore.save

binary = Project.new(title: "Sketch of Binary Perception",
                     description: "2020 was a particularly hard year for the trans and non-binary community. Not only were we struck by the morbid, isolating restrictions of lockdown, but we faced increasing global violence (particularly against trans people of colour), transphobic tirades, and the implementation of devastating policy by Liz Truss. Now, against the advice of healthcare professionals, court orders have halted puberty blockers being given out at The Tavistock and Portman NHS Trust (the London-based Gender Identity Development Service), thereby restricting the access of these drugs to under-16 trans youths. Amid this backdrop of hostility, violence, prejudice, and isolation a group of artists came together during lockdown to resiliently forge a creative trans community. Trans healthcare charity We Exist teamed up with artist studio initiative The Koppel Project to facilitate an artist residency exclusively for trans and non-binary folk. Running from November 2020 to the end of January 2021, the residency provided studio space for 30 creatives in the heart of London. The space was open to trans artists of all creative backgrounds, from dancers and designers to writers and sculptors, covering a wide diversity of gender expressions and identities. The residency takes place at the abandoned, old campus of Central Saint Martins, a building which birthed such legends as Alexander McQueen, Stella McCartney, and Christopher Kane. Taking it over in 2016 in order to provide affordable studio spaces and teaching for artists, The Koppel Project's intention is creating 'a safe, inclusive community for artistic expression and a platform for all emerging makers.' Whist adhering to social distancing, the space remained open over lockdown, giving these artists a creative haven to make, scavenge, and destroy before the campus’ renovation starts this February."
                     status: "open", max_members: 2, user: random_users.sample, start_date: Date.today, end_date: Date.today+rand(10000))
image = URI.open("https://res.cloudinary.com/diucx7fqo/image/upload/v1619544309/nonbinary_k1qnmv.jpg")
binary.photo.attach(io: image, filename: "binary", content_type: "image/png")
binary.tag_list = %w[ gender queer multidisciplinary event ]
binary.save

auction_6 = Project.new(user: winkelhalle, title: "Auction 6 - Group Show",
                        start_date: Date.parse('01-09-2021'),
                        end_date: Date.parse('01-11-2021'),
                        location: "Berlin",
                        description: "With a focus on locally produced art, winkelhalle is committed to supporting new and emerging artists in Berlin to provide a platform for their professional artistic development. Additionally, the exhibition Auction 6 consciously works within the limitations determined by the current conditions of the world—namely, a global pandemic—to find new curatorial possibilities within extraordinary and challenging circumstances. This also gives us the opportunity to re-establish the gallery’s core directives: to remain a consistent and active member of the local community, while considering community health and safety. To this end, Auction 6 will assume a de-centralised format to become the second auction in which the bidding takes place online.
                        In previous auctions at winkelhalle, over 90% of the participating artists and buyers were local to Neukölln. The community-oriented programme of winkelhalle emphasises connection and conviviality, with an intention to generate community networks of artist support and neighbourhood engagement. By taking this localised approach, we aim to raise funds to enable both our gallery and the artists we support to continue producing their respective work, while also maintaining a significant connection to the surrounding neighbourhood. We intend to preserve this community building initiative as central to our curatorial programme, using the online auction format to expand the reach of the gallery for the benefit of the artists we support. Additionally, in order to make art accessible to a wide range of visitors, artworks will be priced at a scale of affordability. ")
image = URI.open("https://res.cloudinary.com/diucx7fqo/image/upload/v1615298435/winkelhalle-auction-6_y3nyys.jpg")
auction_6.photo.attach(io: image, filename: "auction_6", content_type: "image/png")
auction_6.tag_list = %w[ auction winkelhalle neukölln ]
auction_6.tag_list.push("open call")
auction_6.save

glitch = Project.new(title: "d@3cðáv[39 80==", description: "To die: to suffer 0101555% native hue of resolution is sicklied o'er wsh a bare bodkin? Who woulsssss ear the dread of som234ng after death, the thought, and sweat under a weary life; for in that the unworthy takes, when he himself might his quietus make cowards of outrageous fortune, or not to be444t makes calamity of so long a life; fo334mind to sleep to sleep of dispriz'd lc**e, the unworthy takes, when he himself might his quietus make cowards of dispriz'd love, than fly to be wish'd. To be, or t",
                     status: "open", max_members: 2, user: dummy1, start_date: Date.today, end_date: Date.today+rand(10000))
image = URI.open("https://res.cloudinary.com/diucx7fqo/image/upload/v1619544410/glitch_k03av5.jpg")
glitch.photo.attach(io: image, filename: "glitch", content_type: "image/png")
glitch.tag_list = %w[ glitch digital installation ]
glitch.tag_list.push("digital art")
glitch.save

adelaides = Project.new(title: "Adelaide's Voyage", description: " This project aims to assist the clients at Seven Hills Geriatric Center by designing an outdoor interactive space that incorporates universal design principles, and appealed to the cognitive growth and development of the residents. To complete our goal we produced designs and prototypes of recreational activities that integrate educational aspects that meets the accommodations for individuals with various spectrums of cognitive, physical, and developmental disabilities.",
                        status: "open", max_members: 2, user: random_users.sample, start_date: Date.today, end_date: Date.today+rand(10000))
image = URI.open("https://res.cloudinary.com/diucx7fqo/image/upload/v1615308624/old-lady-photo-by-fariansyah-_tsy3xc.jpg")
adelaides.photo.attach(io: image, filename: "adelaides", content_type: "image/png")
adelaides.tag_list = %w[ performance accessibility senses ]
adelaides.save

south = Project.new(title: "South South Veza", user: random_users.sample, start_date: Date.parse('04-08-2021'), end_date: Date.parse('08-10-2021'),
                    description: "The pandemic has disrupted art businesses everywhere, but the reduced ability to travel and the absence of international exhibitions and fairs has exacerbated the isolation of galleries and artists working outside of the established art capitals.
                    Enter South South Veza, a novel sales platform that centers the Global South. Part auction, part online fair, the new model hopes to bring momentum to corners of the market that have been neglected during the pandemic. The platform debuted on February 23 with a live, 22-lot auction and a 49-lot timed online auction, which kicked off a week of online viewing rooms.
                    The hybrid format is being introduced amid a wider blurring of the boundaries between the traditional territories of galleries and auction houses, as private sales become more important for the main houses, and the demand for ultra-contemporary work continues to soar.")
image = URI.open("https://res.cloudinary.com/diucx7fqo/image/upload/v1615395896/Lot-No.3-768x1024_jdggc8.jpg")
south.photo.attach(io: image, filename: "south", content_type: "image/png")
south.tag_list = %w[ painting contemporary auction artfair ]
south.save

sensibel = Project.new(title: "sensibel",
                       description: "We are looking for sculptors and models to pose for a series of sculptors that are going to be painted by me and photographed by Fernanda Souza, later it will be rendered in 3D (we're also looking for a person to do that.) The concept: Originating in philosophical and scientific writings, sensibility became an English-language literary movement, particularly in the then-new genre of the novel. Such works, called sentimental novels, featured individuals who were prone to sensibility, often weeping, fainting, feeling weak, or having fits in reaction to an emotionally moving experience. If one were especially sensible, one might react this way to scenes or objects that appear insignificant to others. This reactivity was considered an indication of a sensible person's ability to perceive something intellectually or emotionally stirring in the world around them. However, the popular sentimental genre soon met with a strong backlash, as anti-sensibility readers and writers contended that such extreme behavior was mere histrionics, and such an emphasis on one's own feelings and reactions a sign of narcissism. Samuel Johnson, in his portrait of Miss Gentle, articulated this criticism: She daily exercises her benevolence by pitying every misfortune that happens to every family within her circle of notice; she is in hourly terrors lest one should catch cold in the rain, and another be frighted by the high wind. Her charity she shews by lamenting that so many poor wretches should languish in the streets, and by wondering what the great can think on that they do so little good with such large estates. Sentimentalism asserted that over-shown feeling was not a weakness but rather showed one to be a moral person. Arising from religiously motivated empathy, it expanded to the other perceptions—for example, sensual love was no longer understood as a destructive passion (Vanitas) but rather as a basis of social institutions, as it was for Antoine Houdar de la Motte. Requited love was, as in serious opera (the Tragédie en musique or Opera seria), a symbol for a successful alliance between nations. The 'Lesesucht' re-evaluated what was permitted literature, and the novel as a type of literature as versus drama.",
                       status: "open", max_members: 2, user: gabi, location: gabi.location, start_date: Date.today, end_date: Date.today+rand(10000))
image = URI.open("https://res.cloudinary.com/diucx7fqo/image/upload/v1619544570/Devostock_Art_Family_Stone_Sculpture_bsn71q.jpg")
sensibel.photo.attach(io: image, filename: "sensibel", content_type: "image/png")
sensibel.tag_list = %w[ sculpture emotions psychology ]
sensibel.save

Project.all.each do |project|
  puts " 💥💥 #{project.title} Created! \n "
end
puts "#{Project.count} projects created."

puts " \n "
puts "🆕👯-- Creating Collabs"
puts " \n "

Collaboration.create(project: Project.where(user: dummy1).first, role: "#{role_generator}", user: dummy2, message: "Hey! I'm #{dummy2.username} and I would love to collaborate in this project.")
puts "Collaboration from dummy 2 on dummy 1 project requested"
puts " \n "

Collaboration.create(project: Project.where(user: dummy2).first, role: "#{role_generator}", user: dummy1, message: "Hey! I'm #{dummy1.username} and I would love to collaborate in this project.")
puts "Collaboration from dummy 1 on dummy 2 project requested"
puts " \n "

counter = 0
40.times do
  role = role_generator
  counter = counter + 1
  collab = Collaboration.create!(project: Project.all.sample, role: "#{role}", user: random_users.sample, message: "Hey! I want to collab as #{role}.")
  puts "Random collab #{counter}: User: #{collab.user.username}, project: #{collab.project.title}"
  puts " \n "
end

puts "📨📨-- Message system seeds ..."

new_chatroom = Chatroom.create
new_message = DirectMessage.create(chatroom: Chatroom.last, user: User.last, content: "This is my first silly direct message")

puts " \n "
puts "Creating very last projects ⌛️"

take_place = Project.new(title: "Take Place, 100 artists in a white cube", user: dummy1, location: "Berlin", start_date: Date.parse('01-08-2021'), end_date: Date.parse('10-08-2021'),
                         description: "The exhibition invites 100 Berlin-based artists to come into an empty gallery space and their presence becomes part of the work. It aims to go beyond the usual bound that separates the artist and the performer from the public, and invite the public to participate in the artist’s experience and to the artist’s point of view.
                         As a response to Institut für Alles Mögliche, Take Place Ⅰ fills the 20 square meter gallery space with artists. Presented through the window wall towards the street, the work consists of live encounters between people, while the material is the artists or the artists’ presence. During the opening hour, street passengers and visitors are welcome to come into the gallery. Once they enter the gallery, the audiences become parts of the work. With artists standing, sitting and chatting in the space, the work erases the difference between the artists and visitors, and questions the general expectations towards an exhibition. It exists as a performance, an interaction, and an immaterial experience.
                         In Take Place ⅠⅠ, a group of artists sit on three rows of stadium seats inside the gallery facing the window, and stare at the street through the entire opening hours. Rather than being observed, the work is observing whatever is happening outside the gallery and creating an unfamiliar situation for both the artists and the viewers. And the work itself is held in the moments of these encounters. Through these encounters, the work challenges the viewers’ as well as the artists’ roles and participations in a work and in an exhibition, blurring the lines between the making, presenting, and experiencing of an art piece.")
image = URI.open("https://res.cloudinary.com/diucx7fqo/image/upload/v1615388104/take_place_jzok5q.jpg")
take_place.photo.attach(io: image, filename: "take_place", content_type: "image/png")
take_place.tag_list = %w[ performance berlin ]
take_place.tag_list.push("white cube", "open call")
take_place.save


not_cancelled = Project.new(user: winkelhalle, title: "Not Cancelled Group Show",
                            start_date: Date.parse('06-06-2021'),
                            end_date: Date.parse('05-07-2021'),
                            location: "Berlin",
                            description: "In collaboration with guest curator Daniela Villalobos, winkelhalle presents the Not Cancelled Group Show. Due to the current pandemic, access of students to their workspaces has been strictly limited and commonly prohibited. Opportunities and platforms for students to exhibit their work have been postponed, cancelled, or forced online. We acknowledge that exhibiting work during studies is an integral part of the learning process. As the regular structure for this process has been compromised, winkelhalle has provided an opportunity for this to continue.")
image = URI.open("https://res.cloudinary.com/diucx7fqo/image/upload/v1615303162/winkelhalle-not-cancelled-group-show-01_azgkhx.jpg")
not_cancelled.photo.attach(io: image, filename: "not_cancelled", content_type: "image/png")
not_cancelled.tag_list = %w[ exhibition winkelhalle neukölln ]
not_cancelled.tag_list.push("open call")
not_cancelled.save

@time_min = (Time.now - @start) / 60
@remainder = ((@time_min - @time_min.floor) * 60).round

puts " \n "
puts "🆕🚩🚩-- Creating Milestones"
puts " \n "

Project.all.each do |project|
  Milestone.create!(project: project, title: "Project created", description: "Project created on #{project.created_at.day} of #{Date::MONTHNAMES[project.created_at.month]} by #{project.user.username}.", completed: true)
end

counter = 0
50.times do
  counter = counter + 1
  milestone = Milestone.create!(project: Project.all.sample, title: "#{Faker::Marketing.buzzwords}", description: "#{milestone_generator}", completed: false)
  puts "Random Milestone #{counter}: project: #{milestone.project.title}"
  puts " \n "
end

puts " \n "
puts "#{User.all.length.to_s} users and #{Project.all.length.to_s} projects created in #{@time_min.floor} minutes and #{@remainder} seconds 🥂✨"



puts " \n "
puts "----------------------SEED ENDED----------------------"
