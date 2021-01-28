require 'rails_helper'

RSpec.describe 'Comment features' do
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
  let(:post) do
    Post.create(user_id: User.first.id, content: 'post content')
  end
  describe 'Creating a comment' do
    it 'comments a post' do
      sign_up
      post
      visit('/')
      fill_in('comment_content', with: 'this is my comment')
      expect(Post.first.comments.first).to eq(Comment.first)
    end
  end
end
