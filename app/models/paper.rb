
class Paper < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable

  acts_as_followable

  mount_uploader :image, FileUploader

  attr_readonly :comments_count

  scope :trending,  lambda { |num = nil| includes(:user).order('papers.created_at  desc'). limit(num) }

  def to_param
    "#{id}-#{title}".parameterize
  end

  def to_writer
     "By #{user.username} #{created_at.strftime("%B %d, %Y")}".titleize
  end

  protected
  def set_filename (name)
    self.original_filename = name if name.present?
  end
end
