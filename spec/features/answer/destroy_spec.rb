require 'rails_helper'

feature 'user can delete answer', "
In order to delete answer
As an authenticated user
I'a like to delete the answer of the question
" do
  shared_examples 'no answers to delete' do
    scenario 'tries to delete answer' do
      visit question_path(question)

      expect(page).not_to have_content('Delete')
    end
  end

  given(:user) { create(:user) }
  given!(:question) { create(:question, user: user) }
  given!(:other_question) { create(:question) }
  given!(:answer) { create(:answer, question: question, user: user) }
  given!(:other_answer) { create(:answer, question: other_question) }

  describe 'authenticated user' do
    background { sign_in(user) }

    scenario 'tries to delete answer' do
      visit question_path(question)

      expect(page).to have_content answer.body

      click_on 'Delete'

      expect(page).to have_content('Your answer has been deleted')
    end

    scenario 'tries to delete question when he is not an author' do
      visit question_path(other_question)

      expect(page).not_to have_content 'Delete'
    end
  end

  describe 'unauthenticated user' do
    scenario 'tries to delete answer' do
      visit question_path(question)

      expect(page).not_to have_content 'Delete'
    end
  end
end
