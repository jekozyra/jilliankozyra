class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :language
      t.string :original

      t.timestamps
    end
    
    create_table :languages_surveys, :id => false do |t|
      t.references :language, :survey
    end

    add_index :languages_surveys, [:language_id, :survey_id]
    
#    remove_column :questions, :language
    add_column :questions, :language_id, :integer
    
  end
end
