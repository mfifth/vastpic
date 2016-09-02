class AddProfileElementsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :avatar, :string
  	add_column :users, :location, :string
  	add_column :users, :about, :string
  	add_column :users, :username, :string
  end
end
