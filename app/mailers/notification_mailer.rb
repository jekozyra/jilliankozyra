# encoding: UTF-8

class NotificationMailer < ActionMailer::Base
  default from: "jilliankozyra@gmail.com"
  
  def survey_notifier(participant, survey)
    @participant = participant
    @survey = survey
    mail(:to => @participant.email, :subject => "Опитування про коаліції у Верховній раді/Опрос о коалициях в Верховной раде/Survey on coalitions in the Verkhova Rada")
  end
  
end
