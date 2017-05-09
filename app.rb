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


post('/survey_edit') do
  @survey = Survey.find(params.fetch('survey_id').to_i)
  erb(:modify_survey)
end

patch('/survey_edit/:id') do
  name = params.fetch("name")
  @survey = Survey.find(params.fetch('id').to_i)
  @survey.update({name: name})
  erb(:modify_survey)
end

delete('/delete_survey/:id') do
  @survey = Survey.find(params.fetch('id').to_i)
  @survey.delete
  @surveys = Survey.all
  erb(:index)
end

get('/question_add/:id') do
  @survey = Survey.find(params.fetch('id').to_i)
  @question = Question.find(params.fetch('id').to_i)
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

post('/question_edit') do
  @question = Question.find(params.fetch('id').to_i)
  erb(:modify_question)
end

patch('/question_edit/:id') do
  description = params.fetch("description")
  @question = Question.find(params.fetch('id').to_i)
  @question.update({description: description})
  erb(:modify_question)
end
