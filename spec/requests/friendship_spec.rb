require 'rails_helper'

RSpec.describe 'Friendship requests' do
  let(:create_users) do
    User.create(name: 'carlos', email: 'carlos@carlos.com', password: 'omar123')
    User.create(name: 'omar', email: 'omar@omar.com', password: 'omar123')
  end

  describe 'POST /create' do
    it 'creates a friendship request and get a redirect status' do
      create_users
      friendship_params = {
        user_id: User.first.id,
        friend_id: User.last.id
      }
      post user_friendships_path(User.first), params: friendship_params
      expect(response).to have_http_status(302)
    end
  end
end
