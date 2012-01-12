class Kit < ActiveRecord::Base

  validates :slug, presence: true
  validates :slug, uniqueness: true
  has_many :steps

  scope :published, where(published: true)
  def to_param
    slug
  end

  def to_s
    name
  end
end
