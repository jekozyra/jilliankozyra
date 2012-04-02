class AddJoinTableForParticipants < ActiveRecord::Migration
  def change
    create_table :participants_surveys, :id => false do |t|
      t.integer :participant_id
      t.integer :survey_id 
    end
  end
end
