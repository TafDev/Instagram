require 'rails_helper'

feature 'Creating a new User' do
  before do
    visit '/'
    click_link 'Register'
  end

  scenario 'can create a new user via index page' do
    fill_in 'Username', with: 'tafdev'
    fill_in 'Email', with: 'tafdev@dev.com'
    fill_in 'Password', with: 'tafdev1'
    fill_in 'Confirm Password', with: 'tafdev1'

    click_link 'Sign up'
    expect(page).to have_content("You have signed up successfully")
  end
end