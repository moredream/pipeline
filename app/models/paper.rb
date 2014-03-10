class Paper < ActiveRecord::Base
  belongs_to :user

  scope :trending,  lambda { |num = nil| includes(:user).order('papers.created_at  desc'). limit(num) }

end
