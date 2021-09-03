require 'rails_helper'

describe Answer, type: :model do
<<<<<<< HEAD
  it { should validate_presence_of :body }
  it { should belong_to(:question) }
  it { should belong_to(:user) }
=======
  it { should validate_presence_of :body}
  it { should belong_to(:question).dependent(:destroy) }
>>>>>>> d43852864566b4709dd6a25091aa0bd9c113e5f5
end
