require 'rails_helper'

RSpec.describe 'User features' do
  let(:sign_up) do
    visit('/')
    click_link('Sign up')
    within('form') do
      fill_in 'Name', with: 'Carlos'
      fill_in 'Email', with: 'carlos@holamundo.com'
      fill_in 'user_password', with: 'carlos1'
      fill_in 'user_password_confirmation', with: 'carlos1'
      click_button 'Sign up'
    end
  end

  describe 'Viewing index' do
    it 'Returns a list with all registered users' do
      sign_up
      visit('/users')
      expect(page).to have_content('Carlos')
    end
  end
  describe 'Viewing show' do
    it 'Display user profile' do
      sign_up
      click_link(User.first.name)
      expect(page).to have_content(User.first.name)
      expect(page).to have_content('Recent posts')
    end
  end
end
