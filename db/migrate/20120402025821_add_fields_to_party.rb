class AddFieldsToParty < ActiveRecord::Migration
  def change
    add_column :parties, :original_name, :string
  end
end
