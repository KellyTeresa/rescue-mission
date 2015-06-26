class Question < ActiveRecord::Base
  has_many :answers, inverse_of: :question
  belongs_to :user, inverse_of: :questions

  validates :title, presence: true, length: { in: 2..100 }
  validates :description, presence: true, length: { in: 2..300 }

end
