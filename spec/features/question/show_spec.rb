require 'rails_helper'

feature 'User can see the question and its answers', "
  In order to find the answer for the question
  As an user
  I'd like to be able to see the question and its answers
" do
  shared_examples 'question and answers' do
    scenario 'tries to see the question and its answer' do
      visit question_path(question)

      expect(page).to have_content question.title
      answers.each do |answer|
        expect(page).to have_content answer.body
      end
    end
  end

  given!(:user) { create(:user) }
  given!(:question) { create(:question) }
  given!(:answers) { create_list(:answer, 3, question: question) }

  describe 'authenticated user' do
    background { sign_in(user) }

    it_behaves_like 'question and answers'
  end

  describe 'unauthenticated user' do
    it_behaves_like 'question and answers'
  end
end
