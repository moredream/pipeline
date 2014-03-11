class AddCountToPapers < ActiveRecord::Migration
  def self.up
    add_column :papers, :comments_count, :integer, default: 0, null: false

    Paper.all.each do |f|
      Paper.reset_counters(f.id, :comments)
    end

  end

  def self.down
    remove_column :programs, :comments_count
  end
end
