class Answer < ApplicationRecord
  belongs_to :question
<<<<<<< HEAD
  belongs_to :user

=======
  
>>>>>>> d43852864566b4709dd6a25091aa0bd9c113e5f5
  validates :body, presence: true
end
