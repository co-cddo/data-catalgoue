require 'rails_helper'

RSpec.describe "DataServices", type: :request do
  include AuthHelper

  context "when unauthorised" do
    describe "GET /data_services" do
      it "does not return data_services" do
        get data_services_path
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  context "when logged in" do
    describe "GET /data_services" do
      it "returns data_services" do
        get data_services_path, headers: http_auth_headers
        expect(response).to have_http_status(:ok)
      end
    end

    describe "GET /data_services/:id" do
      let(:data_service) { create(:data_service) }

      it "returns data_services" do
        get data_service_path(data_service), headers: http_auth_headers
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
