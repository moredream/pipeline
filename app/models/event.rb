require 'file_size_validator'

class Event < ActiveRecord::Base
  belongs_to :user
  has_many :photos, as: :attachable
  has_many :comments, as: :commentable

  validates :title, presence: true
  validates :user_id, presence: true
  validates :target, :file_size => { :maximum => 0.5.megabytes.to_i }

  mount_uploader :target, TargetUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  attr_readonly :comments_count

  acts_as_votable
  acts_as_taggable
  acts_as_taggable_on :offers, :interests
  acts_as_followable


  scope :trending,  lambda { |num = nil| includes(:user).order('created_at  desc').limit(num) }
  scope :hot,  lambda { |num = nil| includes(:user).order('cached_votes_up  desc').limit(num) }
  scope :available,  lambda { |num = nil| includes(:user).limit(num) }
  
  def crop_target
    self.target.recreate_versions! if crop_x.present?
  end

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
    "#{id}-#{title}".parameterize
  end

  def to_writer
     "By #{user.username} #{created_at.strftime("%B %d, %Y")}".titleize
  end

  def profile_pic
    user.image.url(:thumb) || 'profile.png'
  end
end
