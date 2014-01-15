class AddMembershipToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :membership, polymorphic: true, index: true
  end
end
