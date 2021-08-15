require 'rails_helper'

describe AnswersController, type: :controller do
  let(:question) { create(:question) }
  let(:answer) { create(:answer) }

  describe 'POST #create' do 
    context 'with valid attributes' do 
      it ' saves a new answer in the database' do 
        expect { post :create, params: {question_id: question.id, answer: attributes_for(:answer) } }.to change(Answer, :count).by(1)
      end
    end

    context 'with invalid attributes' do 
      it 'does not save the answer' do 
        expect { post :create, params: {question_id: question.id, answer: attributes_for(:answer, :invalid) } }.to_not change(Answer, :count)
      end
    end
  end
end
