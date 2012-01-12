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

  def num_steps
    self.steps.where(bonus: false, freeplay: false).count
  end
end
