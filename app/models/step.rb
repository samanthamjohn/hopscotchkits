class Step < ActiveRecord::Base
  belongs_to :kit
  has_many :requirements
  include ActionView::Helpers

  validates_presence_of :position
  validates_presence_of :kit
  validates_uniqueness_of :kit_id, scope: :position
  def next_step
    self.kit.steps.where("position > ?", self.position).order(:position).first
  end

  def next_step_id
    next_step.id if next_step
  end

  def last_step?
    return false if bonus
    self.kit.steps.where("position > ?", self.position).where(bonus: false).where(freeplay: false).blank?
  end

  def as_json(options=nil)
    if options && options[:serializing]
      super
    else
      if last_step?
        attrs = self.attributes.merge( last_step: true, next_step_id: nil)
      else
        attrs = self.attributes.merge(
          next_step_id: next_step_id,
          last_step: false
        )
      end
      attrs["description"] = simple_format(description, {}, sanitize: false)
      attrs["success_message"] = simple_format(success_message, {}, sanitize: false)
      attrs["solution"] = simple_format(solution, {}, sanitize: false)
      attrs["hint"] = simple_format(hint, {}, sanitize: false)
      attrs["more_info"] = simple_format(more_info, {}, sanitize: false)
      attrs.merge(requirements: self.requirements.map(&:attributes))
    end
  end
end
