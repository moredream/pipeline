class AddTargetToEvents < ActiveRecord::Migration
  def change
    add_column :events, :target, :string
  end
end
