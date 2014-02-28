class AddCountToPrograms < ActiveRecord::Migration
  def self.up
    add_column :programs, :comments_count, :integer, default: 0, null: false

    Program.all.each do |f|
      Program.reset_counters(f.id, :comments)
    end

  end

  def self.down
    remove_column :programs, :comments_count
  end


end
