require 'rails_helper'

describe Question, type: :model do
<<<<<<< HEAD
  it { should belong_to(:user) }
  it { should have_many(:answers).dependent(:destroy) }

  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
=======
  it { should validate_presence_of :title}
  it { should validate_presence_of :body}
>>>>>>> d43852864566b4709dd6a25091aa0bd9c113e5f5
end
