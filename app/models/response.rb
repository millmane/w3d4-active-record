class Response < ActiveRecord::Base
  validates :answer_choice_id, :user_id, presence: true
  # validate :user_exists?#:user_id, uniqueness: true
  validate :author_cant_respond

  belongs_to(
    :answer_choice,
    class_name: :AnswerChoice,
    foreign_key: :answer_choice_id,
    primary_key: :id
  )

  belongs_to(
    :respondent,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id
  )

  has_one(
    :question,
    through: :answer_choice,
    source: :question
  )

  has_one(
    :poll,
    through: :question,
    source: :poll
  )

  def sibling_responses
    question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    sibling_responses.exists?(user_id: self.user_id)
  end


  private
  def user_exists?
    if respondent_already_answered?
      errors[:user_id] << "exists"
    end
  end


  def author_cant_respond

    if self.question.poll.user_id == self.user_id
      errors[:author_id] << "author of poll"
    end
    #  if poll.responses.exists?(user_id: poll.author.id)

    # end
  end

end
