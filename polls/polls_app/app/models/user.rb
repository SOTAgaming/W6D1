class User < ApplicationRecord

  validates :username, presence: true, uniqueness: true

  has_many :authored_polls,
    foreign_key: :author_id,
    class_name: :Poll

  has_many :questions,
    through: :authored_polls,
    source: :questions

  has_many :responses,
    foreign_key: :user_id,
    class_name: :Response
end