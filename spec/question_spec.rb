require "spec_helper"

describe(Question) do
  it("validates presence of question") do
    test_survey = Survey.create({name: "FCC Survey"})
    test_q = Question.create({description: "", survey_id: test_survey.id})
    expect(test_q.save).to(eq(false))
  end

  it("has a minumum character count of 10") do
    test_survey = Survey.create({name: "FCC Survey"})
    test_q = Question.create({description: "Hi", survey_id: test_survey.id})
    expect(test_q.save).to(eq(false))
  end

  it("adds a question mark if there isn't one") do
    test_survey = Survey.create({name: "FCC Survey"})
    test_q = Question.create({description: "How old are you", survey_id: test_survey.id})
    test_q2 = Question.create({description: "How old are you?", survey_id: test_survey.id})
    expect(test_q.description).to(eq("How old are you?"))
    expect(test_q2.description).to(eq("How old are you?"))
  end

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
