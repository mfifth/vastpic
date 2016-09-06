class ChangePhotoColumnTo < ActiveRecord::Migration
  def change
  	rename_column :pictures, :photo, :image_url
  end
end