class Participant < ActiveRecord::Base
  
  has_many :answers
  belongs_to :party
  
end
