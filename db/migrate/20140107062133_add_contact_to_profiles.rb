class AddContactToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :mobile, :string
  end
end
