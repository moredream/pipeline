
class Paper < ActiveRecord::Base
  belongs_to :user

  acts_as_followable
  acts_as_taggable
  acts_as_taggable_on :types


  scope :trending,  lambda { |num = nil| includes(:user).order('papers.created_at  desc'). limit(num) }
  scope :top,  lambda { |num = nil| order('created_at  asc').limit(num) }
  
  def to_param
    "#{id}-#{title}".parameterize
  end

  def to_writer
     "By #{user.username} #{created_at.strftime("%B %d, %Y")}".titleize
  end

end
