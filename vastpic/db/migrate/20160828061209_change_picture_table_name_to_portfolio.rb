class ChangePictureTableNameToPortfolio < ActiveRecord::Migration
  def change
  	rename_table :pictures, :portfolio
  end
end