class AnswerChoice < ApplicationRecord

  validates :question_id, presence: true
  validates :answer, presence: true

  belongs_to :question,
    foreign_key: :question_id,
    class_name: :Question

  has_many :responses,
    foreign_key: :answer_id,
    class_name: :Response
end