class AddListPositionFieldForParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :list_position, :string
  end
end
