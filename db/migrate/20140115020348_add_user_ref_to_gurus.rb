class AddUserRefToGurus < ActiveRecord::Migration
  def change
    add_reference :gurus, :user, index: true
  end
end
