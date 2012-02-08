class Step < ActiveRecord::Base
  belongs_to :kit

  validates_uniqueness_of :kit_id, scope: :position
  def next_step
    self.kit.steps.where("position > ?", self.position).order(:position).first
  end

  def last_step?
    return false if bonus || freeplay
    self.kit.steps.where("position > ?", self.position).where(bonus: false).where(freeplay: false).blank?
  end

  def as_json(options=nil)
    if last_step?
      attrs = self.attributes.merge( last_step: true, next_step_id: nil)
    else
      attrs = self.attributes.merge(
        next_step_id: next_step.id,
        last_step: false
      )
    end
    attrs
  end
end
