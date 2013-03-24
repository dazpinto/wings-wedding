class NotificationsMailer < ActionMailer::Base
  default from: "from@example.com"
  default to: "dazpinto@gmail.com"

  def contact_us_message(message)
    @message = message
    mail(:subject => "Contact us message - #{message.subject}")
  end

  def rsvp_received(rsvp)
    mail(subject: "RSVP received")
  end
end
