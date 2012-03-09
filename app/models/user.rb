class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  validates :slug, uniqueness: true
  has_many :programs
  before_validation :create_slug

  def to_s
    name
  end
  private

  def create_slug
    if self.slug.blank?
      slug = self.name.downcase
      i = 1
      while User.find_by_slug(slug)
        slug = "#{slug}#{i}"
        i += 1
      end
      self.slug = slug
    end
  end
end
