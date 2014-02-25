class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true, counter_cache: true

  scope :available,  lambda { |num = nil| includes(:user).limit(num) }


end
