class AddSocialMediaToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :social, :string
  end
end
