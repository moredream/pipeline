class AddTitleToEvents < ActiveRecord::Migration
  def change
  	  add_column :events, :title, :string
  	  remove_column :events, :name, :string
  end
end
