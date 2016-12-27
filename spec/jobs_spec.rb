require "spec_helper"

describe RelinkApi::Jobs do

  WebMock.disable!

  let(:create_params) { FactoryGirl.build(:job) }

  before do
    RelinkApi.configure do |config|
      config.api_key    = "69813590-96a3-11e6-98ad-e5869d07bac4"
      config.api_secret = "NzNlNTY3MDMtZTg4NC00YzMyLThjMTEtMGZhN2E4OWJlODE2"
      config.account_id = "5861368fc2757d0011a78e4b"
    end

    RelinkApi.authenticate
  end

  context "#create" do
    context "invalid params provided" do
      it "should raise an exception" do
        expect { RelinkApi::Jobs.create({test: 'test'}) }.to raise_error(/missing/)
      end
    end

    context "valid params provided" do

      it "be successful" do
        resp = RelinkApi::Jobs.create(create_params)
        expect(resp.code).to eq(201)
      end
    end
  end

  context "#index" do
    it "should be successful" do
      resp = RelinkApi::Jobs.index
      expect(resp.code).to eq(200)
    end
  end

  context "#show" do
    it "should be successful" do
      resp = RelinkApi::Jobs.create(create_params)
      id = resp.parsed_response["id"]
      resp = RelinkApi::Jobs.show(id)
      expect(resp.code).to eq(200)
    end
  end

  context "#delete" do
    it "should be successful" do
      resp = RelinkApi::Jobs.create(create_params)
      id = resp.parsed_response["id"]
      resp = RelinkApi::Jobs.delete(id)
      expect(resp.code).to eq(200)
    end
  end

end
