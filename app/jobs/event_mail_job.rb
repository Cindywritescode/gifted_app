class EventMailJob < ApplicationJob
  queue_as :default

  def perform(event)
    # user.friends.each do |friend|
    #   puts "#{friend.name}"
    # end
    puts "Sending reminder email to #{event.friend.user.email} for #{event.friend.name}'s #{event.event_type}..."
    sleep 3
    puts "Done!"
  end
end
