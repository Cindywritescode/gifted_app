puts "Destroying all Users, gifts, friends, events, notes & gift ideas..."
puts "Destroying all Gifts...."
Gift.destroy_all
puts "Destroying all Events...."
Event.destroy_all
puts "Destroying all Notes...."
Note.destroy_all
puts "Destroying all Friends (bye bitches 😉) ...."
Friend.destroy_all
puts "Destroying all Users...."
User.destroy_all
puts "Creating Users, friends, events, gifts, notes & gift ideas..."
puts "--"

emily = User.new(
  name: "Emily",
  email: "elgiblett@gmail.com",
  password: "password",
  admin: true
)
emily.save!
puts "User created: #{emily.name}"

friend1 = Friend.new(
  name: "#{Faker::Name.name}",
  user_id: emily.id
  )
friend1.photo.attach(io: File.open(File.join(Rails.root,'app/assets/images/seed/friends/emily_friend.jpeg')), filename: 'emily_friend.jpeg')
friend1.save!
puts "Friend created: #{friend1.name}"

friend2 = Friend.new(
  name: "#{Faker::Name.name}",
  user_id: emily.id
  )
friend2.photo.attach(io: File.open(File.join(Rails.root,'app/assets/images/seed/friends/emily_friend2.jpeg')), filename: 'emily_friend2.jpeg')
friend2.save!
puts "Friend created: #{friend2.name}"

friend3 = Friend.new(
  name: "#{Faker::Name.name}",
  user_id: emily.id
  )
friend3.photo.attach(io: File.open(File.join(Rails.root,'app/assets/images/seed/friends/cindy_friend.jpeg')), filename: 'cindy_friend.jpeg')
friend3.save!
puts "Friend created: #{friend3.name}"

friend4 = Friend.new(
  name: "#{Faker::Name.name}",
  user_id: emily.id
  )
friend4.photo.attach(io: File.open(File.join(Rails.root,'app/assets/images/seed/friends/cindy_friend2.jpeg')), filename: 'cindy_friend2.jpeg')
friend4.save!
puts "Friend created: #{friend4.name}"

friend5 = Friend.new(
  name: "#{Faker::Name.name}",
  user_id: emily.id
  )
friend5.photo.attach(io: File.open(File.join(Rails.root,'app/assets/images/seed/friends/dani_friend.jpeg')), filename: 'dani_friend.jpeg')
friend5.save!
puts "Friend created: #{friend5.name}"

friend6 = Friend.new(
  name: "#{Faker::Name.name}",
  user_id: emily.id
  )
friend6.photo.attach(io: File.open(File.join(Rails.root,'app/assets/images/seed/friends/dani_friend2.jpeg')), filename: 'dani_friend2.jpeg')
friend6.save!
puts "Friend created: #{friend6.name}"

friend7 = Friend.new(
  name: "#{Faker::Name.name}",
  user_id: emily.id
  )
friend7.photo.attach(io: File.open(File.join(Rails.root,'app/assets/images/seed/friends/thomas_friend.jpeg')), filename: 'thomas_friend.jpeg')
friend7.save!
puts "Friend created: #{friend7.name}"

friend8 = Friend.new(
  name: "#{Faker::Name.name}",
  user_id: emily.id
  )
friend8.photo.attach(io: File.open(File.join(Rails.root,'app/assets/images/seed/friends/thomas_friend2.jpeg')), filename: 'thomas_friend2.jpeg')
friend8.save!
puts "Friend created: #{friend8.name}"


event1 = Event.new(
  event_type: "Wedding",
  date: Date.parse('2021-07-15'),
  friend_id: friend1.id,
  user_id: emily.id
  )
event1.save!
puts "Event created: #{friend1.name}'s #{event1.event_type}"

event2 = Event.new(
  event_type: "Birthday",
  date: Date.parse('2021-08-27'),
  friend_id: friend2.id,
  user_id: emily.id
  )
event2.save!
puts "Event created: #{friend2.name}'s #{event2.event_type}"

event3 = Event.new(
  event_type: "Baby Shower",
  date: Date.parse('2021-09-11'),
  friend_id: friend3.id,
  user_id: emily.id
  )
event3.save!
puts "Event created: #{friend3.name}'s #{event3.event_type}"

event4 = Event.new(
  event_type: "Graduation",
  date: Date.parse('2021-06-30'),
  friend_id: friend4.id,
  user_id: emily.id
  )
event4.save!
puts "Event created: #{friend4.name}'s #{event4.event_type}"

event5 = Event.new(
  event_type: "Baby Shower",
  date: Date.parse('2021-07-20'),
  friend_id: friend5.id,
  user_id: emily.id
  )
event5.save!
puts "Event created: #{friend5.name}'s #{event5.event_type}"

event6 = Event.new(
  event_type: "Graduation",
  date: Date.parse('2021-08-01'),
  friend_id: friend6.id,
  user_id: emily.id
  )
event6.save!
puts "Event created: #{friend6.name}'s #{event6.event_type}"

event7 = Event.new(
  event_type: "Divorce Party",
  date: Date.parse('2021-08-08'),
  friend_id: friend7.id,
  user_id: emily.id
  )
event7.save!
puts "Event created: #{friend7.name}'s #{event7.event_type}"

event8 = Event.new(
  event_type: "Graduation",
  date: Date.parse('2021-10-29'),
  friend_id: friend8.id,
  user_id: emily.id
  )
event8.save!
puts "Event created: #{friend6.name}'s #{event8.event_type}"



gift1 = Gift.new(
  gift_url: "https://www.glossier.com/products/the-skincare-edit",
  product_name: "Glossier: The Skincare Edit",
  price: "£#{(35..70).to_a.sample}",
  photo: "/glossier.jpg",
  user_id: emily.id
  )

gift1.save!
puts "Gift created: #{gift1.product_name}"

gift2 = Gift.new(
  gift_url: "https://sculpd.co.uk/products/sculpd",
  product_name: "Sculpd Pottery Kit",

  price: "£#{(35..70).to_a.sample}",
  photo: "/sculpd.jpg",
  user_id: emily.id
  )

gift2.save!
puts "Gift created: #{gift2.product_name}"

gift3 = Gift.new(
  gift_url: "https://support.wwf.org.uk/adopt-a-penguin",
  product_name: "WWF: Adopt a penguin",
  price: "£#{(35..70).to_a.sample}",
  photo: "/adopt.jpg",
  user_id: emily.id
  )

gift3.save!
puts "Gift created: #{gift3.product_name}"

gift4 = Gift.new(
  gift_url: "https://www.spacenk.com/uk/fragrance/home-fragrance/spray-diffuser/post-poo-drops",
  product_name: "Aesop Post Poo Drops",
  price: "£#{(35..70).to_a.sample}",
  photo: "/poodrops.jpg",
  user_id: emily.id
  )

gift4.save!
puts "Gift created: #{gift4.product_name}"

gift5 = Gift.new(
  gift_url: "https://www.buyagift.co.uk/flying-experiences/sunrise-hot-air-balloon-ride",
  product_name: "Hot Air Balloon Ride",
  price: "£#{(35..70).to_a.sample}",
  photo: "/hotairballoon.jpg.jpg",
  user_id: emily.id
  )

gift5.save!
puts "Gift created: #{gift5.product_name}"

gift6 = Gift.new(
  gift_url: "https://www.amazon.co.uk/Untitled-Animal-Unisex-Casual-Novelty/dp/B082FBWT8Y/",
  product_name: "Goose Socks",
  price: "£#{(35..70).to_a.sample}",
  photo: "/socks.jpg",
  user_id: emily.id
  )

gift6.save!
puts "Gift created: #{gift6.product_name}"

gift7 = Gift.new(
  gift_url: "https://www.etsy.com/uk/listing/782364145/nicolas-cage-face-on-wooden-spoon-nic",
  product_name: "Wooden Spoon with Nicholas Cage on it",
  price: "£#{(35..70).to_a.sample}",
  photo: "/nickcagespoon.jpg",
  user_id: emily.id
  )

gift7.save!
puts "Gift created: #{gift7.product_name}"

gift8 = Gift.new(
  gift_url: "https://www.patchplants.com/gb/en/plants/lemon-tree-389/",
  product_name: "Lemon Tree",
  price: "£#{(35..70).to_a.sample}",
  photo: "/lemon.jpg",
  user_id: emily.id
  )

gift8.save!
puts "Gift created: #{gift8.product_name}"

gift9 = Gift.new(
  gift_url: "https://www.amazon.co.uk/Untitled-Animal-Unisex-Casual-Novelty/dp/B082FBWT8Y/",
  product_name: "Goose Socks",
  price: "£#{(35..70).to_a.sample}",
  photo: "/socks.jpg",
  user_id: emily.id
  )

gift9.save!
puts "Gift created: #{gift9.product_name}"

gift10 = Gift.new(
  gift_url: "https://www.findmeagift.co.uk/gifts/grow-your-own-hairy-beaver.html",
  product_name: "Grow your own hairy beaver: Watercress Plant",
  price: "£#{(35..70).to_a.sample}",
  photo: "/beaver.jpg",
  user_id: emily.id
  )

gift10.save!
puts "Gift created: #{gift10.product_name}"

gift11 = Gift.new(
  gift_url: "https://www.patchplants.com/gb/en/plants/lemon-tree-389/",
  product_name: "Lemon Tree",
  price: "£#{(35..70).to_a.sample}",
  photo: "/lemon.jpg",
  user_id: emily.id
  )

gift11.save!
puts "Gift created: #{gift11.product_name}"

gift12 = Gift.new(
  gift_url: "https://www.amazon.co.uk/Untitled-Animal-Unisex-Casual-Novelty/dp/B082FBWT8Y/",
  product_name: "Goose Socks",
  price: "£#{(35..70).to_a.sample}",
  photo: "/socks.jpg",
  user_id: emily.id
  )

gift12.save!
puts "Gift created: #{gift12.product_name}"

note1 = Note.new(
  content: "I remember #{friend1.name} saying that they love penguins",
  friend_id: friend1.id,
  user_id: emily.id
  )
note1.save!

note2 = Note.new(
  content: "#{friend2.name} thought the #{gift2.product_name} was really cute",
  friend_id: friend2.id,
  user_id: emily.id
  )
note2.save!

note3 = Note.new(
  content: "#{friend1.name} is a skincare fanatic",
  friend_id: friend1.id,
  user_id: emily.id
  )
note3.save!

note4 = Note.new(
  content: "I remember #{friend3.name} saying that they love penguins",
  friend_id: friend3.id,
  user_id: emily.id
  )
note4.save!

note5 = Note.new(
  content: "#{friend4.name} thought the #{gift3.product_name} was really cute",
  friend_id: friend4.id,
  user_id: emily.id
  )
note5.save!

note6 = Note.new(
  content: "#{friend3.name} is a skincare fanatic",
  friend_id: friend3.id,
  user_id: emily.id
  )
note6.save!

note7 = Note.new(
  content: "I remember #{friend5.name} saying that they love penguins",
  friend_id: friend5.id,
  user_id: emily.id
  )
note7.save!

note8 = Note.new(
  content: "#{friend5.name} thought the #{gift8.product_name} was really cute",
  friend_id: friend5.id,
  user_id: emily.id
  )
note8.save!

note9 = Note.new(
  content: "#{friend6.name} is a skincare fanatic",
  friend_id: friend6.id,
  user_id: emily.id
  )
note9.save!

note10 = Note.new(
  content: "I remember #{friend7.name} saying that they love penguins",
  friend_id: friend7.id,
  user_id: emily.id
  )
note10.save!

note11 = Note.new(
  content: "#{friend8.name} thought the #{gift11.product_name} was really cute",
  friend_id: friend8.id,
  user_id: emily.id
  )
note11.save!

note12 = Note.new(
  content: "#{friend7.name} is a skincare fanatic",
  friend_id: friend7.id,
  user_id: emily.id
  )
note12.save!

puts "12 notes created"


gift_idea1 = GiftIdea.new(
  friend_id: friend1.id,
  gift_id: gift1.id
  )
gift_idea1.save!

gift_idea2 = GiftIdea.new(
  friend_id: friend2.id,
  gift_id: gift3.id
  )
gift_idea2.save!

gift_idea3 = GiftIdea.new(
  friend_id: friend1.id,
  gift_id: gift2.id
  )
gift_idea3.save!

gift_idea4 = GiftIdea.new(
  friend_id: friend3.id,
  gift_id: gift4.id
  )
gift_idea4.save!

gift_idea5 = GiftIdea.new(
  friend_id: friend4.id,
  gift_id: gift5.id
  )
gift_idea5.save!

gift_idea6 = GiftIdea.new(
  friend_id: friend4.id,
  gift_id: gift3.id
  )
gift_idea6.save!

gift_idea7 = GiftIdea.new(
  friend_id: friend6.id,
  gift_id: gift7.id
  )
gift_idea7.save!

gift_idea8 = GiftIdea.new(
  friend_id: friend5.id,
  gift_id: gift8.id
  )
gift_idea8.save!

gift_idea9 = GiftIdea.new(
  friend_id: friend5.id,
  gift_id: gift9.id
  )
gift_idea9.save!

gift_idea10 = GiftIdea.new(
  friend_id: friend8.id,
  gift_id: gift10.id
  )
gift_idea10.save!

gift_idea11 = GiftIdea.new(
  friend_id: friend7.id,
  gift_id: gift11.id
  )
gift_idea11.save!
gift_idea12 = GiftIdea.new(
  friend_id: friend8.id,
  gift_id: gift12.id
  )
gift_idea12.save!

puts "Gift ideas added to friends"

puts "--"


cindy = User.new(
  name: "Cindy",
  email: "hakkacindy@gmail.com",
  password: "password",
  admin: true
)
cindy.save!
puts "User created: #{cindy.name}"

friend3 = Friend.new(
  name: "#{Faker::Name.name}",
  user_id: cindy.id
  )
friend3.photo.attach(io: File.open(File.join(Rails.root,'app/assets/images/seed/friends/cindy_friend.jpeg')), filename: 'cindy_friend.jpeg')
friend3.save!
puts "Friend created: #{friend3.name}"

friend4 = Friend.new(
  name: "#{Faker::Name.name}",
  user_id: cindy.id
  )
friend4.photo.attach(io: File.open(File.join(Rails.root,'app/assets/images/seed/friends/cindy_friend2.jpeg')), filename: 'cindy_friend2.jpeg')
friend4.save!
puts "Friend created: #{friend4.name}"

event3 = Event.new(
  event_type: "Baby Shower",
  date: Date.parse('2021-07-15'),
  friend_id: friend3.id,
  user_id: cindy.id
  )
event3.save!
puts "Event created: #{friend3.name}'s #{event3.event_type}"

event4 = Event.new(
  event_type: "Graduation",
  date: Date.parse('2021-08-27'),
  friend_id: friend4.id,
  user_id: cindy.id
  )
event4.save!
puts "Event created: #{friend4.name}'s #{event4.event_type}"

gift4 = Gift.new(
  gift_url: "https://www.spacenk.com/uk/fragrance/home-fragrance/spray-diffuser/post-poo-drops",
  product_name: "Aesop Post Poo Drops",
  price: "£#{(35..70).to_a.sample}",
  photo: "/poodrops.jpg",
  user_id: cindy.id
  )

gift4.save!
puts "Gift created: #{gift3.product_name}"

gift5 = Gift.new(
  gift_url: "https://www.buyagift.co.uk/flying-experiences/sunrise-hot-air-balloon-ride",
  product_name: "Hot Air Balloon Ride",
  price: "£#{(35..70).to_a.sample}",
  photo: "/hotairballoon.jpg",
  user_id: cindy.id
  )

gift5.save!
puts "Gift created: #{gift4.product_name}"

gift6 = Gift.new(
  gift_url: "https://www.amazon.co.uk/Untitled-Animal-Unisex-Casual-Novelty/dp/B082FBWT8Y/",
  product_name: "Goose Socks",
  price: "£#{(35..70).to_a.sample}",
  photo: "/socks.jpg",
  user_id: cindy.id
  )

gift6.save!
puts "Gift created: #{gift5.product_name}"

note4 = Note.new(
  content: "I remember #{friend3.name} saying that they love penguins",
  friend_id: friend3.id,
  user_id: cindy.id
  )
note4.save!

note5 = Note.new(
  content: "#{friend4.name} thought the #{gift3.product_name} was really cute",
  friend_id: friend4.id,
  user_id: cindy.id
  )
note5.save!

note6 = Note.new(
  content: "#{friend3.name} is a skincare fanatic",
  friend_id: friend3.id,
  user_id: cindy.id
  )
note6.save!

puts "3 notes created"

gift_idea4 = GiftIdea.new(
  friend_id: friend3.id,
  gift_id: gift4.id
  )
gift_idea4.save!

gift_idea5 = GiftIdea.new(
  friend_id: friend4.id,
  gift_id: gift5.id
  )
gift_idea5.save!
gift_idea6 = GiftIdea.new(
  friend_id: friend4.id,
  gift_id: gift3.id
  )
gift_idea6.save!

puts "Gift ideas added to friends"


puts "--"

puts "--"

dani = User.new(
  name: "Daniella",
  email: "daniella.m@hotmail.co.uk",
  password: "password",
  admin: true
)
dani.save!
puts "User created: #{dani.name}"

friend5 = Friend.new(
  name: "#{Faker::Name.name}",
  user_id: dani.id
  )
friend5.photo.attach(io: File.open(File.join(Rails.root,'app/assets/images/seed/friends/dani_friend.jpeg')), filename: 'dani_friend.jpeg')
friend5.save!
puts "Friend created: #{friend5.name}"

friend6 = Friend.new(
  name: "#{Faker::Name.name}",
  user_id: dani.id
  )
friend6.photo.attach(io: File.open(File.join(Rails.root,'app/assets/images/seed/friends/dani_friend2.jpeg')), filename: 'dani_friend2.jpeg')
friend6.save!
puts "Friend created: #{friend6.name}"

event5 = Event.new(
  event_type: "Baby Shower",
  date: Date.parse('2021-07-15'),
  friend_id: friend5.id,
  user_id: dani.id
  )
event5.save!
puts "Event created: #{friend5.name}'s #{event5.event_type}"

event6 = Event.new(
  event_type: "Graduation",
  date: Date.parse('2021-08-27'),
  friend_id: friend6.id,
  user_id: dani.id
  )
event6.save!
puts "Event created: #{friend6.name}'s #{event6.event_type}"
file = "/images/seed/products/nickcagespoon.jpg"
gift7 = Gift.new(
  gift_url: "https://www.etsy.com/uk/listing/782364145/nicolas-cage-face-on-wooden-spoon-nic",
  product_name: "Wooden Spoon with Nicholas Cage on it",
  price: "£#{(35..70).to_a.sample}",
  photo: "/nickcagespoon.jpg",
  user_id: dani.id
  )

gift7.save!
puts "Gift created: #{gift7.product_name}"

gift8 = Gift.new(
  gift_url: "https://www.patchplants.com/gb/en/plants/lemon-tree-389/",
  product_name: "Lemon Tree",
  price: "£#{(35..70).to_a.sample}",
  photo: "/lemon.jpg",
  user_id: dani.id
  )

gift8.save!
puts "Gift created: #{gift8.product_name}"

gift9 = Gift.new(
  gift_url: "https://www.amazon.co.uk/Untitled-Animal-Unisex-Casual-Novelty/dp/B082FBWT8Y/",
  product_name: "Goose Socks",
  price: "£#{(35..70).to_a.sample}",
  photo: "/socks.jpg",
  user_id: dani.id
  )

gift9.save!
puts "Gift created: #{gift9.product_name}"

note7 = Note.new(
  content: "I remember #{friend5.name} saying that they love penguins",
  friend_id: friend5.id,
  user_id: dani.id
  )
note7.save!

note8 = Note.new(
  content: "#{friend5.name} thought the #{gift8.product_name} was really cute",
  friend_id: friend5.id,
  user_id: dani.id
  )
note8.save!

note9 = Note.new(
  content: "#{friend6.name} is a skincare fanatic",
  friend_id: friend6.id,
  user_id: dani.id
  )
note9.save!

puts "3 notes created"

gift_idea7 = GiftIdea.new(
  friend_id: friend6.id,
  gift_id: gift7.id
  )
gift_idea7.save!

gift_idea8 = GiftIdea.new(
  friend_id: friend5.id,
  gift_id: gift8.id
  )
gift_idea8.save!
gift_idea9 = GiftIdea.new(
  friend_id: friend5.id,
  gift_id: gift9.id
  )
gift_idea9.save!

puts "Gift ideas added to friends"
puts "--"

thomas = User.new(
  name: "Thomas",
  email: "taloubser@gmail.com",
  password: "password",
  admin: true
)
thomas.save!
puts "User created: #{thomas.name}"

friend7 = Friend.new(
  name: "#{Faker::Name.name}",
  user_id: thomas.id
  )
friend7.photo.attach(io: File.open(File.join(Rails.root,'app/assets/images/seed/friends/thomas_friend.jpeg')), filename: 'thomas_friend.jpeg')
friend7.save!
puts "Friend created: #{friend7.name}"

friend8 = Friend.new(
  name: "#{Faker::Name.name}",
  user_id: thomas.id
  )
friend8.photo.attach(io: File.open(File.join(Rails.root,'app/assets/images/seed/friends/thomas_friend2.jpeg')), filename: 'thomas_friend2.jpeg')
friend8.save!
puts "Friend created: #{friend8.name}"

event7 = Event.new(
  event_type: "Divorce Party",
  date: Date.parse('2021-07-15'),
  friend_id: friend7.id,
  user_id: thomas.id
  )
event7.save!
puts "Event created: #{friend7.name}'s #{event7.event_type}"

event8 = Event.new(
  event_type: "Graduation",
  date: Date.parse('2021-08-27'),
  friend_id: friend8.id,
  user_id: thomas.id
  )
event8.save!
puts "Event created: #{friend6.name}'s #{event8.event_type}"

gift10 = Gift.new(
  gift_url: "https://www.findmeagift.co.uk/gifts/grow-your-own-hairy-beaver.html",
  product_name: "Grow your own hairy beaver: Watercress Plant",
  price: "£#{(35..70).to_a.sample}",
  photo: "/beaver.jpg",
  user_id: thomas.id
  )

gift10.save!
puts "Gift created: #{gift10.product_name}"

gift11 = Gift.new(
  gift_url: "https://www.patchplants.com/gb/en/plants/lemon-tree-389/",
  product_name: "Lemon Tree",
  price: "£#{(35..70).to_a.sample}",
  photo: "/lemon.jpg",
  user_id: thomas.id
  )

gift11.save!
puts "Gift created: #{gift11.product_name}"

gift12 = Gift.new(
  gift_url: "https://www.amazon.co.uk/Untitled-Animal-Unisex-Casual-Novelty/dp/B082FBWT8Y/",
  product_name: "Goose Socks",
  price: "£#{(35..70).to_a.sample}",
  photo: "/socks.jpg",
  user_id: thomas.id
  )

gift12.save!
puts "Gift created: #{gift12.product_name}"

note10 = Note.new(
  content: "I remember #{friend7.name} saying that they love penguins",
  friend_id: friend7.id,
  user_id: thomas.id
  )
note10.save!

note11 = Note.new(
  content: "#{friend8.name} thought the #{gift11.product_name} was really cute",
  friend_id: friend8.id,
  user_id: thomas.id
  )
note11.save!

note12 = Note.new(
  content: "#{friend7.name} is a skincare fanatic",
  friend_id: friend7.id,
  user_id: thomas.id
  )
note12.save!

puts "3 notes created"

gift_idea10 = GiftIdea.new(
  friend_id: friend8.id,
  gift_id: gift10.id
  )
gift_idea10.save!

gift_idea11 = GiftIdea.new(
  friend_id: friend7.id,
  gift_id: gift11.id
  )
gift_idea11.save!
gift_idea12 = GiftIdea.new(
  friend_id: friend8.id,
  gift_id: gift12.id
  )
gift_idea12.save!

puts "Gift ideas added to friends"
puts "--"

puts "
*****************

Login details are as follows:
email: #{emily.email}
email: #{cindy.email}
email: #{dani.email}
email: #{thomas.email}
password: password
*****************
"

puts "--"
puts 'Finished!'

