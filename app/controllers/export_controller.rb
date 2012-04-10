# encoding: UTF-8

require 'iconv'

class ExportController < ApplicationController
  
  layout 'survey'

  before_filter :admin_authorize
  
  def index
    @surveys = Survey.all
    @participants = Participant.all
  end

  def export
    if params[:participant]
      @participants = Participant.find(:all, :conditions => ["id IN (?)", params[:participant]])
    #r:iso-8859-1:utf-8
      File.new("#{Rails.public_path}/files/participants.csv", "a+")
    
      File.open("#{Rails.public_path}/files/participants.csv", "w+:utf-8") do |participants_file|
        participants_file.puts "Name|Original Name|Email|Party|List Position|Profile Link|Survey Code"
        @participants.each do |participant|
          participant_string = ""
          if participant.name
            participant_string += participant.name + "|"
          else
            participant_string += "|"
          end
          if participant.original_name
            participant_string += participant.original_name + "|"
          else
            participant_string += "|"
          end          
          if participant.email
            participant_string += participant.email + "|"
          else
            participant_string += "|"
          end          
          if participant.party
            participant_string += participant.party.abbreviation + "|"
          else
            participant_string += "|"
          end          
          if participant.list_position
            participant_string += participant.list_position + "|"
          else
            participant_string += "|"
          end
          if participant.profile_link
            participant_string += participant.profile_link + "|"
          else
            participant_string += "|"
          end
          if participant.survey_code
            participant_string += participant.survey_code + "|"
          else
            participant_string += "|"
          end                       
          participants_file.puts participant_string
        end
      end
    end

    #send_data("#{Rails.public_path}/files/participants.csv", :type => "text/csv")
    
    #File.delete("#{Rails.public_path}/files/participants.csv") if File::exists?("#{Rails.public_path}/files/participants.csv")
    
    redirect_to administration_url
  end
  
end
