class RemoveParticipantColumnsFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :party
    remove_column :users, :survey_code
  end
end
