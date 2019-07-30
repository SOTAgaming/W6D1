class Poll < ApplicationRecord

  validates :author_id, presence: true
  validates :title, presence: true

  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User

  has_many :questions,
    foreign_key: :poll_id,
    class_name: :Question

end