class User < ActiveRecord::Base
  validates :slug, uniqueness: true
  before_create do
    self.slug = self.name.downcase
  end
end
