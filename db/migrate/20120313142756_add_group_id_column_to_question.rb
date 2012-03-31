class AddGroupIdColumnToQuestion < ActiveRecord::Migration
  def change
    remove_column :questions, :group
    add_column :questions, :question_group_id, :integer
  end
end
