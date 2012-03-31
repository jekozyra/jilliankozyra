class DeleteJoinTable < ActiveRecord::Migration
  def change
    drop_table :languages_surveys
  end
end
