class Party < ActiveRecord::Base
  
  default_scope :order => "name"
  
  has_many :participants
  
  def both_names
    "#{self.name}/#{self.original_name[0..82]}" if self.name and self.original_name
  end
  
end
