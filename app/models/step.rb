class Step < ActiveRecord::Base
  belongs_to :kit
  include ActionView::Helpers

  validates_presence_of :position
  validates_presence_of :kit
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
    attrs["description"] = simple_format(description)
    attrs["success_message"] = simple_format(success_message)
    attrs["solution"] = simple_format(solution)
    attrs["hint"] = simple_format(hint)
    attrs["more_info"] = simple_format(more_info)
    attrs
  end
end
