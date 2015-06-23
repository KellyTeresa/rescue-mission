class Answer < ActiveRecord::Base
  belongs_to :question, inverse_of: :answers

  validates :description, presence: true, length: { minimum: 50 }
end
