class ExportController < ApplicationController
  
  layout 'survey'
  
  def index
    @surveys = Survey.all
    @participants = Participant.all
  end

  def export
    if params[:participant]
      @participants = Participant.find(:all, :conditions => ["id IN (?)", params[:participant]])
    
      File.new("#{Rails.public_path}/files/participants.csv", "a+")
    
      File.open("#{Rails.public_path}/files/participants.csv", "w+") do |participants_file|
        participants_file.puts "Name|Original Name|Email|Party|List Position|Profile Link|Survey Code"
        @participants.each do |participant|
          participants_file.puts "#{participant.name}|#{participant.original_name}|#{participant.email}|#{participant.party}|#{participant.list_position}|#{participant.profile_link}|#{participant.survey_code}"
        end
      end
    end

    #send_data("#{Rails.public_path}/files/participants.csv", :type => "text/csv")
    
    #File.delete("#{Rails.public_path}/files/participants.csv") if File::exists?("#{Rails.public_path}/files/participants.csv")
    
    redirect_to administration_url
  end
  
end
