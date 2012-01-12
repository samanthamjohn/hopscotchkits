class Step < ActiveRecord::Base
  belongs_to :kit
  def next_step
    self.kit.steps.where("position > ?", self.position).order(:position).first
  end

  def last_step?
    self.kit.steps.where("position > ? ", self.position).where(bonus: false).where(freeplay: false).blank?
  end
end
