class AddNameAndPartyToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :party, :string
  end
end
