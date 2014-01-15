class ChangeBioToProfiles < ActiveRecord::Migration
  def change
    change_column :profiles, :bio, :text
  end
end
