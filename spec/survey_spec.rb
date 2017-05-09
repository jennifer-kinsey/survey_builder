require "spec_helper"

describe(Survey) do
  describe("#questions")do
    it("tells which questions are in the survey") do
      test_survey = Survey.create({name: "FCC Survey"})
      test_q1 = Question.create({description: "How old are you?", survey_id: test_survey.id})
      test_q2 = Question.create({description: "How old is your cat?", survey_id: test_survey.id})
      expect(test_survey.questions).to eq([test_q1, test_q2])
    end
  end

  describe("#answers") do
    it("tells what answers are on the survey") do
      test_survey = Survey.create({name: "FCC Survey"})
      test_q1 = Question.create({description: "How old are you?", survey_id: test_survey.id})
      test_a1 = Answer.create({response: "Under 18", question_id: test_q1.id, survey_id: test_survey.id})
      test_a2 = Answer.create({response: "Over 18", question_id: test_q1.id, survey_id: test_survey.id})
      expect(test_survey.answers).to eq([test_a1, test_a2])
    end
  end
end
