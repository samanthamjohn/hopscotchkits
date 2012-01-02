class Kit < ActiveRecord::Base

  validates :slug, presence: true
  validates :slug, uniqueness: true
  def to_param
    slug
  end
end
