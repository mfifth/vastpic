class CreateJoinTableTagsPictures < ActiveRecord::Migration
  def change
    create_join_table :tags, :pictures do |t|
      t.index [:tag_id, :picture_id]
      t.index [:picture_id, :tag_id]
    end
  end
end
