class AddEventToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :location, :string
  end
end
