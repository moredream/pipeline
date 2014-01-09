class Article < ActiveRecord::Base
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings

  scope :recents, order("created_at desc")
  scope :trending, lambda { |num = nil| where('created_at > ?', 1.day.ago).order('created_at  desc'). limit(num) }

  validates :title, presence: true
  validates :user_id, presence: true

  has_attached_file :image,
  :styles => {  :thumb => "100x100>",
  :mobile => "200x200>",
  :medium => "300x300>"},
  :default_url => "/images/:style/missing.png"

  validates_attachment :image,
    :content_type => { :content_type => ["image/jpg", "image/gif", "image/png"] }

  def self.tagged_with(name)
    Tag.find_by_name!(name).articles
  end


  def self.tag_counts
    Tag.select("tags.id, tags.name, count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id, tags.id, tags.name")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

end
