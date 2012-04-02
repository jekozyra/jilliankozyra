class RenamePartyColumn < ActiveRecord::Migration
  def change
    rename_column :participants, :party, :party_name
    
    @participants = Participant.find(:all)
        
    @participants.each do |participant|
      party = Party.find_by_original_name(participant.party_name)

      
      unless party.nil?
        participant.party_id = party.id
        participant.save
      end
    end
  end
end
