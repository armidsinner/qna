class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :answers, dependent: :destroy
  has_many :questions, dependent: :destroy

  def check_author?(resourse)
    resourse.user_id == self.id
  end
end
