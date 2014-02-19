class Article < ActiveRecord::Base
  belongs_to :user
  has_many :photos, as: :attachable
  has_many :comments, as: :commentable
  has_many :tags, through: :taggings
  has_many :taggings

  scope :trending,  lambda { |num = nil| includes(:tags, :user).where('created_at > ?', 5.day.ago).order('created_at  desc'). limit(num) }

  validates :title, presence: true
  validates :user_id, presence: true
  mount_uploader :image, ImageUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  def self.tagged_with(name)
    # Tag.find_by_name!(name).articles
    includes(:tags, :user).where("tags.name = ?", name).references(:tags)
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def to_param
    "#{id}-#{title}".parameterize
  end

  def self.trends(num)
    if num.present?
      includes(:tags, :user).where('created_at > ?', 5.day.ago).order('created_at  desc').limit(num)
    else
      includes(:tags, :user).where('created_at > ?', 5.day.ago).order('created_at  desc')
    end
  end

  def to_writer
     "By #{user.username} #{created_at.strftime("%B %d, %Y")}".titleize
  end

end
