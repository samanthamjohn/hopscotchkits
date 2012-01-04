class User < ActiveRecord::Base
  validates :slug, uniqueness: true
  has_many :programs
  before_create do
    self.slug = self.name.downcase
  end
end
