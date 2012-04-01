class AdministrationController < ApplicationController
  
  before_filter :admin_authorize
  
  layout 'survey'
  
  def invite_participants
  end
  
  def submit_invite_participants
    @survey = Survey.find(params[:survey])
    recipients = params[:participants]
    
    recipients.each do |recipient|
      participant = Participant.find(recipient)
      NotificationMailer.survey_notifier(participant, @survey).deliver
    end
  end
  

  def notify_participants
  end
  
  def submit_notify_participants
  end
  
end
