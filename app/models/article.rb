class Article < ActiveRecord::Base
  belongs_to :user
  has_many :photos, as: :attachable
  has_many :comments, as: :commentable
  has_many :tags, through: :taggings
  has_many :taggings

  validates :title, presence: true
  validates :user_id, presence: true
  mount_uploader :image, ImageUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  attr_readonly :comments_count

  scope :trending,  lambda { |num = nil| includes(:tags, :user).where('created_at > ?', 15.day.ago).order('created_at  desc'). limit(num) }
  scope :available,  lambda { |num = nil| includes(:tags, :user).limit(num) }

  acts_as_votable

  #
  # scope :not_discontinued,  -> { where("discontinued_at is null or discontinued_at > ?", Time.zone.now) }
  # scope :in_stock,          -> { where("stock >= ?", 2) }
  # scope :available,         -> { released.not_discontinued.in_stock }


  def self.search(query)
    trending.where("title like ?", "%#{query}%")
  end

  def self.search_tags(query, tag_id)
    available.where("title like ?", "%#{query}%")
    available.where("tags.id = ?", tag_id).references(:tags) if tag_id.present?
  end

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
      trending.limit(num)
    else
      trending
    end
  end

  def to_writer
     "By #{user.username} #{created_at.strftime("%B %d, %Y")}".titleize
  end
end
