class AddMemberToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :bio, :string
  end
end
