require 'rails_helper'

feature 'User can create answer', "
  In order to give answer to a community
  As an authenticated user
  I'a like to be able to answer the question
" do
  given(:user) { create(:user) }
  given(:question) { create(:question) }

  describe 'Authenticated user' do
    background do
      sign_in(user)

      visit question_path(question)
    end

    scenario 'answers the question' do
      fill_in 'Your answer', with: 'Test question'

      click_on 'Send answer'

      expect(page).to have_content 'Good job!'
      expect(page).to have_content 'Test question'
    end

    scenario 'answer question with errors' do
      click_on 'Send answer'

      expect(page).to have_content 'Oooops something went wrong((('
    end
  end

  scenario 'Unauthenticated user tries to answer the question' do
    visit question_path(question)
    click_on 'Send answer'

    expect(page).to have_content 'You need to sign in or sign up before continuing'
  end
end
