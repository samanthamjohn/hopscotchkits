class Program < ActiveRecord::Base
 belongs_to :kit
 def to_param
   self.name.downcase
 end
end
