require 'rails_helper'

describe AnswersController, type: :controller do
  let!(:user) { create(:user) }
  let!(:question) { create(:question) }

  before { login(user) }

  describe 'POST #create' do
    let(:post_create) { post :create, params: { question_id: question.id, answer: answer_params } }

    context 'with valid attributes' do
      let(:answer_params) { attributes_for(:answer) }

      it 'saves a new answer in the database' do
        expect { post_create }.to change(question.answers, :count).by(1)
      end

      it 'adds a answer to the user' do
        expect { post_create }.to change(user.answers, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      let(:answer_params) { attributes_for(:answer, :invalid) }
      it 'does not save the answer' do
        expect do
          post :create,
               params: { question_id: question.id, answer: answer_params }
        end.to_not change(Answer, :count)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:delete_destroy) { delete :destroy, params: { id: answer.id } }

    let!(:answer) { create(:answer, user: user, question: question) }

    it 'should delete the answer' do
      expect { delete_destroy }.to change(question.answers, :count).by(-1)
    end

    context 'user is not the author of the answer' do
      let!(:answer) { create(:answer, question: question) }

      it 'should not delete answer' do
        expect { delete_destroy }.not_to change(question.answers, :count)
      end
    end
  end
end
