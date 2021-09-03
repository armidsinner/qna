require 'rails_helper'

feature 'User can see the list of all questions', "
  As an user
  I'd like to be able to see the list of all questions
" do
  shared_examples 'questions list' do
    scenario 'tries to see the questions' do
      visit questions_path

      expect(page).to have_content('Questions')
      questions.each do |question|
        expect(page).to have_content(question.title)
      end
    end
  end

  given!(:user) { create(:user) }
  given!(:questions) { create_list(:question, 3) }

  describe 'authenticated user' do
    background { sign_in(user) }

    it_behaves_like 'questions list'
  end

  describe 'unauthenticated user' do
    it_behaves_like 'questions list'
  end
end
