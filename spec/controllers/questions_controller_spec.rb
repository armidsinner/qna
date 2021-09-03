require 'rails_helper'

describe QuestionsController, type: :controller do
  describe 'GET #index' do
    let(:questions) { create_list(:question, 3) }

    before { get :index }

    it 'populates an array of all questions' do
      expect(assigns(:questions)).to match_array(questions)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: question } }

    let!(:question) { create(:question) }
    it 'assigns the  requested question to @question' do
      expect(assigns(:question)).to eq question
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'Authenticated user' do
    let!(:user) { create(:user) }

    before { login(user) }

    describe 'GET #new' do
      before { get :new }

      it 'assigns a new Question to @question' do
        expect(assigns(:question)).to be_a_new(Question)
      end

      it 'renders new view' do
        expect(response).to render_template :new
      end
    end

    describe 'POST #create' do
      let(:post_create) { post :create, params: { question: question_params } }

      context 'with valid attributes' do
        let(:question_params) { attributes_for(:question) }

        it 'saves a new question in the database' do
          expect { post_create }.to change(Question, :count).by(1)
        end

        it 'redirects to show view' do
          post_create

          expect(response).to redirect_to assigns(:question)
        end
      end

      context 'with invalid attributes' do
        let(:question_params) { attributes_for(:question, :invalid) }
        it 'does not save the question' do
          expect { post_create }.to_not change(Question, :count)
        end

        it 're-renders new view' do
          post_create

          expect(response).to render_template :new
        end
      end
    end

    describe 'GET #edit' do
      before { get :edit, params: { id: question } }

      let!(:question) { create(:question, user: user) }
      it 'assigns the requested question to @question' do
        expect(assigns(:question)).to eq question
      end

      it 'renders edit view' do
        expect(response).to render_template :edit
      end
    end

    describe 'PATCH #update' do
      let!(:question) { create(:question, user: user) }

      context 'with valid attributes' do
        it 'assigns the  requested question to @question' do
          patch :update, params: { id: question, question: attributes_for(:question) }
          expect(assigns(:question)).to eq question
        end

        it 'changes question attributes' do
          patch :update, params: { id: question, question: { title: 'new title', body: 'new body' } }
          question.reload

          expect(question.title).to eq 'new title'
          expect(question.body).to eq 'new body'
        end

        it 'redirects to updated quetion' do
          patch :update, params: { id: question, question: attributes_for(:question) }
          expect(response).to redirect_to question
        end
      end
      context 'with invalid attributes' do
        before { patch :update, params: { id: question, question: attributes_for(:question, :invalid) } }

        it 'does not chanhe question' do
          question.reload

          expect(question.title).to eq 'MyString'
          expect(question.body).to eq 'MyText'
        end

        it 're-renders edit view' do
          expect(response).to render_template :edit
        end
      end
    end

    describe 'DELETE #destroy' do
      let(:delete_destroy) { delete :destroy, params: { id: question.id } }

      let!(:question) { create(:question, user: user) }

      it 'should delete question' do
        expect { delete_destroy }.to change(Question, :count).by(-1)
      end

      it 'redirects to questions' do
        delete_destroy
        expect(response).to redirect_to questions_path
      end

      context 'user is not the author of the question' do
        let!(:question) { create(:question) }

        it 'should not delete question' do
          expect { delete_destroy }.to change(Question, :count).by(0)
        end
      end
    end
  end
end
