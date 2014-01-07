class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates :slug, uniqueness: true, presence: true
  before_validation :generate_slug

  has_many :microposts, dependent: :destroy
  has_one :profile, inverse_of: :user
  accepts_nested_attributes_for :profile
  #delegate :bio, to: :profile

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

  def feed
    Micropost.where("user_id = ?", id)
  end

  # def to_param
  #   slug
  # end

  def generate_slug
    self.slug ||= username.parameterize
  end

end
