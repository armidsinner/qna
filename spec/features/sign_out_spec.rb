require 'rails_helper'

feature 'User can sign out', "
  In order to finish quit the account
  As an authenticated user
  I'd like to be able to sign out
" do
  given(:user) { create(:user) }

  background { sign_in(user) }

  scenario 'authenticated user tries to sign out' do
    click_on 'Logout'

    expect(page).to have_content('Signed out successfully.')
  end
end
