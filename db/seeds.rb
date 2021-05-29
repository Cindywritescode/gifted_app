# require 'faker'

puts "Destroying all Users, gifts, friends, events, notes & gift ideas..."
puts "Destroying all Gifts...."
Gift.destroy_all
puts "Destroying all Events...."
Event.destroy_all
puts "Destroying all Friends (bye bitches 😉) ...."
Friend.destroy_all
puts "Destroying all Notes...."
Note.destroy_all
puts "Destroying all Users...."
User.destroy_all
puts "Creating Users, friends, events, gifts, notes & gift ideas..."
puts "--"

emily = User.new(
  name: "Emily",
  email: "emily@me.org",
  password: "password"
)
emily.save!
puts "User created: #{emily.name}"

friend1 = Friend.new(
  name: "#{Faker::Name.name}",
  user_id: emily.id
  )
friend1.save!
puts "Friend created: #{friend1.name}"

friend2 = Friend.new(
  name: "#{Faker::Name.name}",
  user_id: emily.id
  )
friend2.save!
puts "Friend created: #{friend2.name}"

event1 = Event.new(
  event_type: "Wedding",
  date: Date.parse('2021-07-15'),
  friend_id: friend1.id
  )
event1.save!
puts "Event created: #{friend1.name}'s #{event1.event_type}"

event2 = Event.new(
  event_type: "Birthday",
  date: Date.parse('2021-08-27'),
  friend_id: friend2.id
  )
event2.save!
puts "Event created: #{friend2.name}'s #{event2.event_type}"

gift1 = Gift.new(
  gift_url: "https://www.glossier.com/products/the-skincare-edit",
  product_name: "Glossier: The Skincare Edit",
  price: (35..70).to_a.sample,
  user_id: emily.id
  )
# gift1.photo.attach(io: File.open(File.join(Rails.root,'app/assets/images/seed/products/glossier.jpg')), filename: 'glossier.jpg')
gift1.save!
puts "Gift created: #{gift1.product_name}"

gift2 = Gift.new(
  gift_url: "https://sculpd.co.uk/products/sculpd",
  product_name: "Sculpd Pottery Kit",
  price: (35..70).to_a.sample,
  user_id: emily.id
  )
# gift2.photo.attach(io: File.open(File.join(Rails.root,'app/assets/images/seed/products/sculpd.jpg')), filename: 'sculpd.jpg')
gift2.save!
puts "Gift created: #{gift2.product_name}"

gift3 = Gift.new(
  gift_url: "https://support.wwf.org.uk/adopt-a-penguin",
  product_name: "WWF: Adopt a penguin",
  price: (35..70).to_a.sample,
  user_id: emily.id
  )
# gift2.photo.attach(io: File.open(File.join(Rails.root,'app/assets/images/seed/products/adopt.jpg')), filename: 'adopt.jpg')
gift3.save!
puts "Gift created: #{gift3.product_name}"

















