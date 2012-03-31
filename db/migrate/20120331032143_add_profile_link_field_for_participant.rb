class AddProfileLinkFieldForParticipant < ActiveRecord::Migration
  def change
    add_column :participants, :profile_link, :string
  end
end
