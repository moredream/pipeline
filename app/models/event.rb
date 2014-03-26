class Event < ActiveRecord::Base
  belongs_to :user
  has_many :photos, as: :attachable
  has_many :comments, as: :commentable

  validates :name, presence: true
  validates :user_id, presence: true

  acts_as_voter
  acts_as_taggable
  acts_as_taggable_on :offers, :interests
  acts_as_followable

  attr_readonly :comments_count

  scope :trending,  lambda { |num = nil| includes(:user).order('created_at  desc').limit(num) }
  scope :hot,  lambda { |num = nil| includes(:user).order('cached_votes_up  desc').limit(num) }
  scope :available,  lambda { |num = nil| includes(:user).limit(num) }
  
  def self.trends(num)
    if num.present?
      hot.limit(num)
    else
      hot
    end
  end

  def self.offers
	ActsAsTaggableOn::Tag.includes(:taggings).where("taggings.context = 'offers'")
  end

  def to_param
    "#{id}-#{name}".parameterize
  end

  def to_writer
     "By #{user.username} #{created_at.strftime("%B %d, %Y")}".titleize
  end

end
