namespace :event do
  desc "Notify Users of upcoming events - 14 days"

  task notify_users: :environment do
    
    events = Event.where(date: (Date.today + 2.weeks))
    events.each do |event|
      # Testing in the terminal
      puts "Emailing: #{event.friend.user.email}, about #{event.friend.name}'s #{event.event_type} on #{event.date}"
      # Sending the email
      EventMailer.notify14(event).deliver_now
    end 
  
  end

end
