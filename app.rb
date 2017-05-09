require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/survey")
require("./lib/question")
require("./lib/answer")
require("pg")
require ("pry")

get('/') do
  @surveys = Survey.all
  erb(:index)
end

get('/survey_new') do
  erb(:create_survey)
end

post('/survey_add') do
  name = params.fetch("name")
  @survey = Survey.create({name: name})
  @questions = @survey.questions
  erb(:add_questions)
end

post('/question_add/:id') do
  @survey = Survey.find(params.fetch('id').to_i)
  description = params.fetch("description")
  @question = Question.create({description: description, survey_id: @survey.id})
  @questions = @survey.questions
  erb(:add_questions)
end

get('/survey_edit/:id') do
  @survey = Survey.find(params.fetch('id').to_i)
  erb(:modify_survey)
end
