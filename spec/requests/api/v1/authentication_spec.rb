require 'rails_helper'
require 'support/auth_helper'

RSpec.describe "Api::V1::Authentications", type: :request do

  describe "POST /api/v1/authentication" do
    it "returns http success" do
      post "/api/v1/authentication"
      expect(response).to have_http_status(:forbidden)
    end
  end

end
