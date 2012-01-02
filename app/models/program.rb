class Program < ActiveRecord::Base
  belongs_to :kit
  belongs_to :current_step, foreign_key: :step_id, class_name: "Step"

  before_create :set_current_step

  def to_param
    self.name.downcase
  end

  def next_step
    self.kit.steps.where("position > ?", self.current_step.position).order(:position).first
  end

private
  def set_current_step
    self.current_step = self.kit.steps.order(:position).first
  end
end
