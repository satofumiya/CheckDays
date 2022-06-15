require 'rails_helper'

RSpec.describe 'Goals', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get '/goal/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/goal/create'
      expect(response).to have_http_status(:success)
    end
  end
end
