class Question < ApplicationRecord

  validates :poll_id, presence: true
  validates :question, presence: true

  belongs_to :poll,
    foreign_key: :poll_id,
    class_name: :Poll

  has_many :answer_choices,
    foreign_key: :question_id,
    class_name: :AnswerChoice

  has_many :responses,
    foreign_key: :question_id,
    class_name: :Response    

  def results
    hash = Hash.new(0)
    self.answer_choices.each do |choice|
      hash[choice.answer] = choice.responses.count
    end
    hash
  end

  def better_results 
    hash = Hash.new(0)
    self.answer_choices.includes(:responses).each { |choice| hash[choice.answer] = choice.responses.count }
    hash
  end
end