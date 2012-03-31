class Question < ActiveRecord::Base
  
  belongs_to :survey
  belongs_to :question_group
  belongs_to :language
  has_many :answers, :dependent => :destroy
  has_many :choices, :dependent => :destroy
  
  accepts_nested_attributes_for :choices, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  
  def mandatory?
    self.mandatory
  end
  
end
