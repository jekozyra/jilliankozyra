class Survey < ActiveRecord::Base
  
  validates_presence_of :title
  has_many :questions, :dependent => :destroy
  has_many :question_groups
  has_many :answers, :through => :questions
  has_many :languages, :through => :questions
  has_and_belongs_to_many :participants
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  
  
  def questions_for_language(language_id)
    self.questions.where(:language_id => language_id).order(:number)
  end
  
  def completed_participants
    self.participants.where("id IN (?)", self.answers.map{|answer| answer.participant_id})
  end
  
  
end
