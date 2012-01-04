class User < ActiveRecord::Base
  validates :slug, uniqueness: true
  has_many :programs
  before_validation :create_slug

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
