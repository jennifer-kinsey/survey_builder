class Question < ActiveRecord::Base
  belongs_to(:survey)
  has_many(:answers)
  validates(:description, {presence: true, length: { minimum: 10}})
  before_save(:add_question_mark)

private
  def add_question_mark
    if self.description[-1, 1] != "?"
      self.description+="?"
    end
  end
end
