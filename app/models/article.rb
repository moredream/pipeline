class Article < ActiveRecord::Base
  belongs_to :user
  has_many :photos, as: :attachable
  has_many :comments, as: :commentable
  has_many :groups, through: :groupings
  has_many :groupings

  validates :title, presence: true
  validates :user_id, presence: true
  mount_uploader :image, ImageUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  attr_readonly :comments_count

  scope :trending,  lambda { |num = nil| includes(:user).order('created_at  desc').limit(num) }
  scope :hot,  lambda { |num = nil| includes(:user).order('cached_votes_up  desc').limit(num) }
  scope :available,  lambda { |num = nil| includes(:user).limit(num) }

  acts_as_votable

  def self.search(query)
    trending.where("title like ?", "%#{query}%")
  end

  def self.search_tags(keywords, group_id)
    articles = Article.available
    articles = articles.where("title like ?", "%#{keywords}%") if keywords.present?
    articles = articles.includes(:groups).where("groups.id = ?", group_id).references(:groups) if group_id.present? and group_id !=""
    articles
  end

  def self.group_with(name)
    available.includes(:groups).where("groups.name = ?", name).references(:groups)
  end

  def group_list
    groups.map(&:name).join(", ")
  end

  def to_param
    "#{id}-#{title}".parameterize
  end

  def self.trends(num)
    if num.present?
      hot.limit(num)
    else
      hot
    end
  end

  def to_writer
     "By #{user.username} #{created_at.strftime("%B %d, %Y")}".titleize
  end
end
