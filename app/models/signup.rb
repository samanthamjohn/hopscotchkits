class Signup < ActiveRecord::Base
  validates :email, presence: true
  validates :source, presence: true
end
