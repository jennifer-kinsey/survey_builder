class AddQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column(:questions, :survey_id, :integer)
  end
end
