require 'rails_helper'

RSpec.describe 'Like requests' do
  let(:user) do
    User.create(email: 'carlos@holamundo.com', name: 'carlos', password: 'carlos1')
  end
  let(:user_params) do
    {
      user: {
        email: 'carlos@holamundo.com',
        password: 'carlos1'
      }
    }
  end
  describe 'GET index' do
    it 'get root path when user logged in' do
      user
      post user_session_path, params: user_params
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET show' do
    it 'get user profile page and http status' do
      user
      post user_session_path, params: user_params
      get "/users/#{user.id}"
      expect(response).to have_http_status(200)
    end
  end
end
