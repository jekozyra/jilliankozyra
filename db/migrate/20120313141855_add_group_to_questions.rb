class AddGroupToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :group, :string
  end
end
