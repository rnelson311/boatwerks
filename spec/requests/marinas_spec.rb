require 'rails_helper'

RSpec.describe "Marinas", type: :request do
  describe "GET /marinas" do
    it "works! (now write some real specs)" do
      get marinas_path
      expect(response).to have_http_status(200)
    end
  end
end
