require 'file_size_validator'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates :username, presence: true

  has_many :articles, dependent: :destroy
  has_many :programs, dependent: :destroy
  has_many :labs, dependent: :destroy
  has_many :papers, dependent: :destroy
  has_many :events, dependent: :destroy

  has_many :comments

  has_one :profile, inverse_of: :user, dependent: :destroy

  has_one :guru, inverse_of: :user, dependent: :destroy
  delegate :guru?, :become_guru, to: :guru , :allow_nil => true

  accepts_nested_attributes_for :profile

  mount_uploader :image, ImageUploader
  validates :image, :file_size => { :maximum => 0.5.megabytes.to_i }

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_avatar

  acts_as_voter
  acts_as_follower
  acts_as_followable
  
  # scope :mentor,  lambda { |num = nil| where(membership_type: 'Member').order('username  desc').limit(num) }

  def crop_avatar
    self.image.recreate_versions! if crop_x.present?
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email =  auth.info.email || "#{auth.uid}@notdefined.com"
      user.username = auth.info.nickname || auth.info.name
      user.image = auth.info.image
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  def to_param
    "#{id}-#{username}".parameterize
  end

end
