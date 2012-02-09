class Kit < ActiveRecord::Base

  validates :slug, presence: true
  validates :slug, uniqueness: true
  has_many :steps
  has_many :programs

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

  def step(position)
    self.steps.where(position: position).first.try(:id)
  end

  def freeplay_step
    self.steps.where(freeplay: true).first
  end

  def has_freeplay?
    freeplay_step.present?
  end

  def bonus
    self.steps.where(bonus: true).order("position").first.position
  end

  def has_bonus?
    self.steps.where(bonus: true).any?
  end
end
