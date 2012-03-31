class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.string :language
      t.string :category
      t.integer :number
      t.integer :survey_id

      t.timestamps
    end
  end
end
