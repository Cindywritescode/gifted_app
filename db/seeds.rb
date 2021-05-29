puts "Destroying all Users, gifts, friends, events, notes & gift ideas..."
puts "Destroying all Users...."
User.destroy_all
puts "Destroying all Gifts...."
Gift.destroy_all
puts "Destroying all Friends (bye bitches 😉) ...."
Friend.destroy_all
puts "Destroying all Events...."
Event.destroy_all
puts "Destroying all Notes...."
Note.destroy_all
puts "Creating Users, gifts, friends, events, notes & gift ideas..."
puts "--"
