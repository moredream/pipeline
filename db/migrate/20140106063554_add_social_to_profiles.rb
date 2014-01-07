class AddSocialToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :twitter, :string
    add_column :profiles, :linkedin, :string
    add_column :profiles, :google, :string
    add_column :profiles, :image, :string
  end
end
