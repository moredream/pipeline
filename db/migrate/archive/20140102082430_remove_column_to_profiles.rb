class RemoveColumnToProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :user_id, :string
  end
end
