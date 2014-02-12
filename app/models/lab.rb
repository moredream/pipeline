require 'file_size_validator'

class Lab < ActiveRecord::Base
  belongs_to :user
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :photos, as: :attachable

  accepts_nested_attributes_for :categorizations, allow_destroy: true

  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :image, :file_size => { :maximum => 0.5.megabytes.to_i }

  attr_reader :category_tokens
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  def category_tokens=(tokens)
    self.category_ids = Category.ids_from_tokens(tokens)
  end

  def to_param
    "#{id}-#{name}".parameterize
  end

  private


end
