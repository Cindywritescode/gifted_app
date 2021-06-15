class EventMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.event_mailer.notify14.subject
  #
  def notify14(event = "")
    @event = event
    # binding.pry 


    mail to: "hakkacindy@gmail.com", subject: "Gifted Reminder - 14 Days!"
  end
end
