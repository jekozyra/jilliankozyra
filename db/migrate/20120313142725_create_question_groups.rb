class CreateQuestionGroups < ActiveRecord::Migration
  def change
    create_table :question_groups do |t|
      t.string :title
      t.integer :survey_id

      t.timestamps
    end
  end
end
