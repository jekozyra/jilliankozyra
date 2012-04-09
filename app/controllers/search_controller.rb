class SearchController < ApplicationController
  
  before_filter :admin_authorize
  
  layout 'survey'
  
  def index
    @surveys = Survey.all
    survey = @surveys.first
    @participants = survey.participants
    @questions = Question.find_by_sql("SELECT questions.* FROM questions, languages WHERE questions.survey_id = #{survey.id} AND questions.language_id = languages.id AND languages.language = 'English' order by questions.number")
    @parties = Party.find(:all, :conditions => ["id IN (?)", @participants.map{|participant| participant.party_id}.compact.uniq])
  end
  
  def refine_survey_details
    survey = Survey.find(params[:survey])
    @participants = survey.participants
    @questions = Question.find_by_sql("SELECT * FROM questions, languages WHERE questions.survey_id = #{survey.id} AND questions.language_id = languages.id AND languages.language = 'English' order by questions.number")
    @parties = Party.find(:all, :conditions => ["id IN (?)", @participants.map{|participant| participant.party_id}.compact.uniq])
  end
  
  def refine_participants
    survey = Survey.find(params[:survey])
    @participants = survey.participants.where("party_id IN (?)", params[:party])
  end

  def results
    @results = []
    survey = Survey.find(params[:survey])
    if params[:participant] and params[:question]
      @results = Answer.find(:all, :conditions => ["participant_id IN (?) AND question_id IN (?)", params[:participant], params[:question]])
    else
      if params[:participant]
        @results = Answer.find(:all, :conditions => ["participant_id IN (?)", params[:question]])
      end
      
      if params[:question]
        @results = Answer.find(:all, :conditions => ["question_id IN (?)", params[:question]])
      end
    end
    
    @results.sort_by!{|result| result.question.number}
    
  end
  
end
