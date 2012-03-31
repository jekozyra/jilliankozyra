class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :name
      t.string :original_name
      t.string :email
      t.string :party
      t.string :survey_code

      t.timestamps
    end
  end
end
