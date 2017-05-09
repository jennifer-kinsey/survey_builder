class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :response
      t.integer :question_id
      t.integer :survey_id
    end
  end
end
