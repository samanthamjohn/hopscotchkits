class Requirement < ActiveRecord::Base
  validates :name, presence: true
  validates :spec, presence: true
  validates :position, presence: true
  belongs_to :step
end
