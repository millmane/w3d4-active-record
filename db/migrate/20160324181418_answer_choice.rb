class AnswerChoice < ActiveRecord::Migration
  def change
    create_table :answer_choices do |t|
      t.integer :question_id, null: false
      t.string :choice, null: false
      t.timestamp
    end

    add_index :answer_choices, :question_id
    add_index :answer_choices, :choice
  end
end
