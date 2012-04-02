class AdministrationController < ApplicationController
  
  before_filter :admin_authorize
  
  layout 'survey'
  
  def invite_participants
    @particpants = Participant.find(:all, :conditions => ["email IS NOT NULL"])#(:email => "is not null")
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
  
  
  def load_records
    
    if File.exists?("#{Rails.public_path}/files/rada_ukr") and File.exists?("#{Rails.public_path}/files/rada_eng")
      IO.foreach("#{Rails.public_path}/files/rada_ukr") do |line|
        rep_ukr = line.chomp.split("|")
          
        unless Participant.exists?(:profile_link => rep_ukr[4])
          participant = Participant.new(:original_name => rep_ukr[0],
                                         :email => rep_ukr[1],
                                         :party => rep_ukr[2],
                                         :list_position => rep_ukr[3],
                                         :profile_link => rep_ukr[4])
        
          participant.survey_code = rand(36**12).to_s(36)
          if participant.save
            puts "Created " + participant.original_name
          else
            puts "Failed to save " + participant.original_name
          end
        else
          puts "Record already exists for " + rep_ukr[0]
        end
      end # done loading records from ukr file
      
      IO.foreach("#{Rails.public_path}/files/rada_eng") do |line|
        rep_eng = line.chomp.split("|")
        
        participant = Participant.find_by_profile_link(rep_eng[2])
        
        participant.name = rep_eng[0] unless participant.nil?
        participant.save! unless participant.nil?
        
        puts rep_eng[2] if participant.nil?

      end
      
    end
    
    redirect_to participants_url
    
  end # end load_records
  
end
