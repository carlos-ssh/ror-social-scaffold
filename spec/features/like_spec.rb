require 'rails_helper'

RSpec.describe 'Like features' do
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
  let(:create_post) do
    Post.create(user_id: User.first.id, content: 'post content')
    visit('/')
  end
  describe 'Creating a like' do
    it 'likes to a post' do
      sign_up
      create_post
      click_link('Like!')
      expect(page).to have_content('You liked a post.')
    end
  end
  describe 'Destroy a like' do
    it 'dislike a post' do
      sign_up
      create_post
      click_link('Like!')
      click_link('Dislike!')
      expect(page).to have_content('You disliked a post.')
    end
  end
end
