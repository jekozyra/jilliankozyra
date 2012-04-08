class Participant < ActiveRecord::Base
  
  has_many :answers
  belongs_to :party
  has_and_belongs_to_many :surveys
  
  def both_names
    if self.name and self.original_name
      "#{self.name}/#{self.original_name}"
    else
      self.name
    end
  end
  
end
