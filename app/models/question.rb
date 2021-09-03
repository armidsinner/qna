class Question < ApplicationRecord
<<<<<<< HEAD
  has_many :answers, dependent: :destroy
  belongs_to :user
=======
  has_many :answers, dependent: :destroy 
>>>>>>> d43852864566b4709dd6a25091aa0bd9c113e5f5

  validates :title, :body, presence: true
end
