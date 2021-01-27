require 'rails_helper'

RSpec.describe 'Post features' do
  let('Sign up') do
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
    it 'display recent posts' do
      sign_up
      visit('/')
      expect(page).to have_content('Recent posts')
    end
  end

  describe 'Creating a post' do
    it 'Creates a post when valid' do
      sign_up
      visit('/')
      fill_in('post_content', with: 'First post')
      click_button('Save')
      expect(page).to have_content('Post was successfully created.')
      expect(Post.first.content).to eq('First post')
    end
  end
end
