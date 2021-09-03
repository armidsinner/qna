require 'rails_helper'

feature 'user can delete question' do
  shared_examples 'no questions to delete' do
    scenario 'tries to delete question' do
      visit question_path(question)

      expect(page).not_to have_content('Delete question')
    end
  end

  given(:user) { create(:user) }
  given!(:question) { create(:question, user: user) }
  given!(:other_question) { create(:question) }

  describe 'authenticated user' do
    background { sign_in(user) }

    scenario 'tries to delete question' do
      visit question_path(question)

      expect(page).to have_content question.title

      click_on 'Delete question'

      expect(page).to have_content('Your question has been deleted')
    end

    scenario 'tries to delete question when he is not an author' do
      visit question_path(other_question)

      expect(page).to have_content other_question.title

      click_on 'Delete question'

      expect(page).to have_content('You are not author to delete this question')
    end
  end

  describe 'unauthenticated user' do
    scenario 'tries to delete question' do
      visit question_path(question)

      click_on 'Delete question'

      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end
  end
end
