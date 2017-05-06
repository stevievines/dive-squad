require 'rails_helper'

RSpec.describe "Fundamentals", type: :request do
  describe "GET /fundamentals" do
    it "works! (now write some real specs)" do
      get fundamentals_path
      expect(response).to have_http_status(200)
    end
  end
end
