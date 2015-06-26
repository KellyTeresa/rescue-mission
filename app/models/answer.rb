class Answer < ActiveRecord::Base
  belongs_to :question, inverse_of: :answers
  belongs_to :user, inverse_of: :answers

  validates :description, presence: true, length: { in: 2..150 }
end
