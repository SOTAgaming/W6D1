require "byebug"
class Response < ApplicationRecord

  validates :user_id, presence: true
  validates :question_id, presence: true
  validates :answer_id, presence: true
  validate :validates_presence
  validate :author_validation

  belongs_to :answer_choice,
    foreign_key: :answer_id,
    class_name: :AnswerChoice
  
  belongs_to :user,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :question,
    foreign_key: :question_id,
    class_name: :Question


  def respondent_already_answered?
    sibling_responses.any? do |res| 
      res.user_id == self.user_id
    end
  end

  def validates_presence 
    if respondent_already_answered?
      errors[:user_id] << 'already answered'
    end
  end

  def sibling_responses
    # Response.joins(:question).where("id = ?", self.id )
    self.question.responses.where('id != ?', self.id)
  end 

  def author_validation
    # debugger
    if self.question.poll.author_id == self.user_id
      errors[:user_id] << 'cant answer your own question'
    end
  end

  
end