class AddCachedToEvents < ActiveRecord::Migration
  def self.up
  	add_column :events, :cached_votes_total, :integer, :default => 0
    add_column :events, :cached_votes_score, :integer, :default => 0
    add_column :events, :cached_votes_up, :integer, :default => 0
    add_column :events, :cached_votes_down, :integer, :default => 0
    add_column :events, :cached_weighted_score, :integer, :default => 0
    add_column :events, :comments_count, :integer, default: 0, null: false
    
    add_index  :events, :cached_votes_total
    add_index  :events, :cached_votes_score
    add_index  :events, :cached_votes_up
    add_index  :events, :cached_votes_down
    add_index  :events, :cached_weighted_score

    # Uncomment this line to force caching of existing votes
    Event.find_each(&:update_cached_votes)
    
    Event.all.each do |f|
      Program.reset_counters(f.id, :comments)
    end

  end

  def self.down
  	remove_column :events, :cached_votes_total
    remove_column :events, :cached_votes_score
    remove_column :events, :cached_votes_up
    remove_column :events, :cached_votes_down
    remove_column :events, :cached_weighted_score
    remove_column :events, :comments_count
  end

end
