class RemoveAuthToProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :provider, :string
    remove_column :profiles, :uid, :string
    remove_column :profiles, :image, :string
    remove_column :profiles, :url, :string
  end
end
