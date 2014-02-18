class AddLevelToTags < ActiveRecord::Migration
  def change
    add_column :tags, :level, :string
  end
end
