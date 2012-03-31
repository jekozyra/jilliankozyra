class Participant < ActiveRecord::Base
  
  has_many :answers
  
end
