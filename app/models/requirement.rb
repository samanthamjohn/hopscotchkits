class Requirement < ActiveRecord::Base
  validates :name, presence: true
  validates :spec, presence: true
  validates :message, presence: true
  belongs_to :step
end
