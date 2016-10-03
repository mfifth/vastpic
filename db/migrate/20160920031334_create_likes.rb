class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
    	t.references :user, foreign_key: true, index: true
    	t.references :picture, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end
