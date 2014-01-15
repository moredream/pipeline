class RemoveColumnUsers < ActiveRecord::Migration
  def change
    remove_column :users ,:membership_id, :integer
    remove_column :users ,:membership_type, :string

  end
end
