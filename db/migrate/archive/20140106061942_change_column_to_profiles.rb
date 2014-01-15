class ChangeColumnToProfiles < ActiveRecord::Migration
  def change
    change_column :profiles, :user_id, :integer, :null => false
  end
end
