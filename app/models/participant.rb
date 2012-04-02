class Participant < ActiveRecord::Base
  
  has_many :answers
  belongs_to :party
  has_and_belongs_to_many :surveys
  
end
