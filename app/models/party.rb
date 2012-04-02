class Party < ActiveRecord::Base
  
  has_many :participants
  
end
