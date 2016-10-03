class AddFeaturedToPhotos < ActiveRecord::Migration
  def change
  	add_column :pictures, :featured, :boolean, default: false
  end
end
