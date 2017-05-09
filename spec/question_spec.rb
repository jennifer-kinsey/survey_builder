require "spec_helper"

describe(Question) do
  describe("#survey") do
    it("tells you which survey it belongs to") do
      test_survey = Survey.create({name: "FCC Survey"})
      test_q = Question.create({description: "How old are you?", survey_id: test_survey.id})
      expect(test_q.survey).to eq(test_survey)
    end
  end

  describe("#answers") do
    it("tells what answers are for the question") do
      test_survey = Survey.create({name: "FCC Survey"})
      test_q1 = Question.create({description: "How old are you?", survey_id: test_survey.id})
      test_a1 = Answer.create({response: "Under 18", question_id: test_q1.id, survey_id: test_survey.id})
      test_a2 = Answer.create({response: "Over 18", question_id: test_q1.id, survey_id: test_survey.id})
      expect(test_q1.answers).to eq([test_a1, test_a2])
    end
  end
end
