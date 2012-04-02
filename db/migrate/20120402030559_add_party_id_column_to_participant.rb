class AddPartyIdColumnToParticipant < ActiveRecord::Migration
  def change
    add_column :participants, :party_id, :integer
    
  end
end
