require "spec_helper"

describe(Answer) do
  describe("#question") do
    it("tells you which question the answer belongs to") do
      test_survey = Survey.create({name: "FCC Survey"})
      test_q = Question.create({description: "How old are you?", survey_id: test_survey.id})
      test_a = Answer.create({response: "Under 18", question_id: test_q.id, survey_id: test_survey.id})
      expect(test_a.question).to eq(test_q)
    end
  end
  describe("#survey") do
    it("tells you which survey the answer belongs to") do
      test_survey = Survey.create({name: "FCC Survey"})
      test_q = Question.create({description: "How old are you?", survey_id: test_survey.id})
      test_a = Answer.create({response: "Under 18", question_id: test_q.id, survey_id: test_survey.id})
      expect(test_a.survey).to eq(test_survey)
    end
  end
end
