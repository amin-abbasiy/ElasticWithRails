require_relative '../../support/helper'

RSpec.describe ::Logs::Create do
  context "Successful" do
    subject { ::Logs::Create.new(whitelist_params, self).call.response }

    it "Create" do
      expect(subject.body).to include_json(elastic_response)
    end

    it "Status" do
      expect(subject.status).to have_http_status(:created)
    end
  end

  context "Unsuccessful" do
    subject { ::Logs::Create.new(corrupt_params, self).call.response }

    it "Create" do
      expect(subject.body).to include_json(elastic_error)
    end

    it "Status" do
      expect(subject.status).to have_http_status(:bad_request)
    end
  end
end