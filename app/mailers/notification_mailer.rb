class NotificationMailer < ActionMailer::Base
  default from: "jilliankozyra@gmail.com"
  
  def survey_notifier(participant, survey)
    @participant = participant
    mail(:to => @participant.email, :subject => "New survey - #{survey.title}!")
  end
  
end
