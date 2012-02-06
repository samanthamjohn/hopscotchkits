class Snapshot < ActiveRecord::Base
  belongs_to :program
  belongs_to :step
end
