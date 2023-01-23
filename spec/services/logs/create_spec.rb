require 'rails_helper'
RSpec.describe Logs::Create, :type => :service do
  let(:whitelist_params){
    {
      "ip": "::1",
      "path": "/",
      "creation_time": 1674471553,
      "request_info": {
        "request_id": "03b78629-2c87-4444-8db9-b77a07a69493",
        "method": "GET",
        "url": "http://localhost:3000/"
      }
    }
  }

  let(:corrupt_params) {
    {
      "ip": "::1",
      "path": "/",
      "creation_time": 1674471553,
      "request_info": {
        "request_id": "03b78629-2c87-4444-8db9-b77a07a69493",
        "method": "GET",
        "url": "http://localhost:3000"
      }
    }.to_json
  }

  context "Successful" do
    subject { ::Logs::Create.new(whitelist_params, self).call.response }

    it "Create" do
      expect(JSON.parse(subject.body)["result"]).to eq("created")
    end

    it "Status" do
      expect(subject.code).to eq("201")
    end
  end

  context "Unsuccessful" do
    subject { ::Logs::Create.new(corrupt_params, self).call.response }

    it "Create" do
      expect(JSON.parse(subject.body)["error"]["reason"]).to eq("failed to parse")
    end

    it "Status" do
      expect(subject.code).to eq("400")
    end
  end
end