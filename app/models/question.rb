class Question < ActiveRecord::Base

  validates :poll_id, :text, presence: true
  validates :text, uniqueness: true

  belongs_to(
    :poll,
    class_name: :Poll,
    foreign_key: :poll_id,
    primary_key: :id
  )

  has_many(
    :answer_choices,
    class_name: :AnswerChoice,
    foreign_key: :question_id,
    primary_key: :id
  )

  has_many(
  :responses,
  through: :answer_choices,
  source: :responses
  )

  # def results
  #   ayy = {}
  #   answer_choices.each do |choice|
  #     ayy[choice.choice] = choice.responses.count
  #   end
  #   ayy
  # end

  def results
    ayy = {}
    Question.includes(:answer_choices, :responses).where(id: self.id).each do |question|
      question.answer_choices.each do |choice|
        ayy[choice.choice] = choice.responses.count
      end
    end
    ayy
  end
end
