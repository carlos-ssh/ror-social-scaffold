require 'rails_helper'

RSpec.describe Like do
  let(:user) do
    User.create(email: 'carlos@holamundo.com', name: 'Carlos', password: 'carlos1')
  end
  let(:post) do
    Post.create(user_id: user.id, content: 'post content')
  end
  describe 'Associations' do
    it 'belongs to user' do
      like = Like.reflect_on_association(:user)
      expect(like.macro).to eq(:belongs_to)
    end
    it 'belongs to post' do
      like = Like.reflect_on_association(:post)
      expect(like.macro).to eq(:belongs_to)
    end
  end
  describe 'Validations' do
    describe 'user_id' do
      it 'must be unique' do
        post
        Like.create(post_id: post.id, user_id: user.id)
        expect(Like.create(post_id: post.id, user_id: user.id)).to_not be_valid
      end
    end
  end
end
