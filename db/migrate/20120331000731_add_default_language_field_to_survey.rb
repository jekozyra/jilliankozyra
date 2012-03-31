class AddDefaultLanguageFieldToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :default_language_id, :integer
  end
end
