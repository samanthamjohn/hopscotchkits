class Kit < ActiveRecord::Base

  validates :slug, presence: true
  validates :slug, uniqueness: true
  has_many :steps
  def to_param
    slug
  end
end
