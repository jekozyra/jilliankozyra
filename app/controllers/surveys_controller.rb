# encoding: UTF-8

class SurveysController < ApplicationController
  
  before_filter :admin_authorize, :except => [:choose_language, :load_questions, :thanks]
  before_filter :is_eligible, :only => [:choose_language]
  
  layout 'survey'
  
  
  def home
    @notification_text = params[:notification_text]
  end
  
  
  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = Survey.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @surveys }
    end
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
    @survey = Survey.find(params[:id])
    @language = params[:language] ? Language.find_by_language(params[:language]) : Language.find_by_language("English")
    @questions = @survey.questions_for_language(@language)
    
    @welcome_text = ""
    @intro_text = ""
    if @language.language == "English"
      @welcome_text = "Hello. This survey will ask you to answer questions about your experiences as a member of the 
      Verkhovna Rada. It should take 20-30 minutes to complete. Please answer as best you can. Thank you for your participation."
      @intro_text = "Please complete the following questions. Mandatory questions are marked with an asterisk (*)."
    elsif @language.language == "Russian"
      @welcome_text = "Здравствуйте. В этом вопросе, речь будет идти о Вашем опыте в Верховной раде. Опрос будет занимать около 
      20-30 минут. Пожалуйста, постарайтесь ответить тщательно на все вопросы. Спасибо большое за участие."
      @intro_text = "Пожалуйста"
    elsif @language.language == "Ukrainian"
      @welcome_text = "Вітаю. У цьому опитуванні буде йти мова про Ваш досвід у Верховні Раді. Це опитування не займе більше 
      ніж 20-30 хвилин. Прошу ретельно відповідати на питання. Дуже вдячна за участь."
      @intro_text = "Please complete the following questions. Mandatory questions are marked with an asterisk (*)."
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @survey }
    end
  end
  
  
  def change_language
    @survey = Survey.find(params[:survey_id])
    @language = params[:language_id] ? Language.find(params[:language_id]) : Language.find_by_language("English")
    @questions = @survey.questions_for_language(@language)
    
    @welcome_text = ""
    @intro_text = ""
    if @language.language == "English"
      @welcome_text = "Hello. This survey will ask you to answer questions about your experiences as a member of the 
      Verkhovna Rada. It should take 20-30 minutes to complete. Please answer as best you can. Thank you for your participation."
      @intro_text = "Please complete the following questions. Mandatory questions are marked with an asterisk (*)."
    elsif @language.language == "Russian"
      @welcome_text = "Здравствуйте. В этом вопросе, речь будет идти о Вашем опыте в Верховной раде. Опрос будет занимать около 
      20-30 минут. Пожалуйста, постарайтесь ответить тщательно на все вопросы. Спасибо большое за участие."
      @intro_text = "Пожалуйста"
    elsif @language.language == "Ukrainian"
      @welcome_text = "Вітаю. У цьому опитуванні буде йти мова про Ваш досвід у Верховні Раді. Це опитування не займе більше 
      ніж 20-30 хвилин. Прошу ретельно відповідати на питання. Дуже вдячна за участь."
      @intro_text = "Please complete the following questions. Mandatory questions are marked with an asterisk (*)."
    end
    
  end
  

  # GET /surveys/new
  # GET /surveys/new.json
  def new
    @survey = Survey.new
    3.times do
      question = @survey.questions.build
      4.times { question.choices.build }
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @survey }
    end
  end

  # GET /surveys/1/edit
  def edit
    @survey = Survey.find(params[:id])
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(params[:survey])

    respond_to do |format|
      if @survey.save
        format.html { redirect_to @survey, notice: 'Survey was successfully created.' }
        format.json { render json: @survey, status: :created, location: @survey }
      else
        format.html { render action: "new" }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /surveys/1
  # PUT /surveys/1.json
  def update
    @survey = Survey.find(params[:id])

    respond_to do |format|
      if @survey.update_attributes(params[:survey])
        format.html { redirect_to @survey, notice: 'Survey was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  def choose_language
    @survey = Survey.find(params[:id])
    @survey_code = params[:survey_code]
    @intro_text = "Please select a language for the survey. / Пожалуйста"
  end
  
  
  def load_questions
    @survey = Survey.find(params[:survey_id])
    @language = params[:language] ? Language.find(params[:language]) : Language.find_by_language("English")
    @questions = @survey.questions_for_language(@language)
    @survey_code = params[:survey_code]
    
    @welcome_text = ""
    @intro_text = ""
    if @language.language == "English"
      @welcome_text = "Hello. This survey will ask you to answer questions about your experiences as a member of the 
      Verkhovna Rada. It should take 20-30 minutes to complete. Please answer as best you can. Thank you for your participation."
      @intro_text = "Please complete the following questions. Mandatory questions are marked with an asterisk (*)."
    elsif @language.language == "Russian"
      @welcome_text = "Здравствуйте. В этом вопросе, речь будет идти о Вашем опыте в Верховной раде. Опрос будет занимать около 
      20-30 минут. Пожалуйста, постарайтесь ответить тщательно на все вопросы. Спасибо большое за участие."
      @intro_text = "Пожалуйста"
    elsif @language.language == "Ukrainian"
      @welcome_text = "Вітаю. У цьому опитуванні буде йти мова про Ваш досвід у Верховні Раді. Це опитування не займе більше 
      ніж 20-30 хвилин. Прошу ретельно відповідати на питання. Дуже вдячна за участь."
      @intro_text = "Please complete the following questions. Mandatory questions are marked with an asterisk (*)."
    end
  end
  
  
  def thanks
    @page_title = "Thanks!"
  end
    

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to surveys_url }
      format.json { head :no_content }
    end
  end
end
