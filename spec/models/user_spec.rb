require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:questions).dependent(:destroy) }
  it { should have_many(:answers).dependent(:destroy) }

  it { should validate_presence_of :email }
  it { should validate_presence_of :password }


  describe '#check_author?' do
    let(:user) { create(:user) }
    let(:resource) { double user_id: user_id }
    let(:user_id) { user.id }

    context 'when the user is author' do

    it { expect(user).to be_check_author(resource) }
    end
    
    context 'when the user is not author' do
      let(:user2) { create(:user) }
      let(:user_id) { user2.id }

      it { expect(user).not_to be_check_author(resource) }
    end
  end

end
