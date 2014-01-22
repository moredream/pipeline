class AddLabToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :url, :string
    add_column :profiles, :lab, :text
  end
end
