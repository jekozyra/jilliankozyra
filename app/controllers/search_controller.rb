class SearchController < ApplicationController
  
  before_filter :admin_authorize
  
  layout 'survey'
  
  def index
    @surveys = Survey.all
    survey = @surveys.first
    @participants = survey.completed_participants
    @questions = Question.find_by_sql("SELECT questions.* FROM questions, languages WHERE questions.survey_id = #{survey.id} AND questions.language_id = languages.id AND languages.language = 'English' order by questions.number")
    @parties = Party.find(:all, :conditions => ["id IN (?)", @participants.map{|participant| participant.party_id}.compact.uniq])
  end
  
  def refine_participants
    survey = Survey.find(params[:survey])
    unless params[:party] == "null"
      @participants = survey.participants.where("party_id IN (?)", params[:party]) & survey.completed_participants
    else
      @participants = survey.completed_participants
    end
  end

  def results
    @results = []
    survey = Survey.find(params["survey"])

    # get full list of potential question ids
    question_ids = []
    if params["question"]
      questions = Question.find(:all, :conditions => ["id IN (?)", params["question"].map{|id| id.to_i}])
      question_ids = Question.find(:all, :conditions => ["survey_id = ? AND number IN (?)", survey.id, questions.map{|question| question.number}])
    end

    if params["participant"] and params["question"]
      @results = Answer.find(:all, :conditions => ["participant_id IN (?) AND question_id IN (?)", params["participant"].map{|id| id.to_i}, question_ids])
    else
      if params["participant"]
        @results = Answer.find(:all, :conditions => ["participant_id IN (?)", params["participant"].map{|id| id.to_i}])
      end
      
      if params["question"]
        @results = Answer.find(:all, :conditions => ["question_id IN (?)", question_ids])
      end
    end
    
    @results.sort_by!{|result| result.question.number}
  end
  
end
