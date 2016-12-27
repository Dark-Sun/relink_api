require "spec_helper"

describe RelinkApi::Analyze do

  WebMock.disable!

  let(:job)     { FactoryGirl.build(:job) }
  let(:profile) { FactoryGirl.build(:profile) }

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
        expect { RelinkApi::Analyze.create({test: 'test'}) }.to raise_error(/missing/)
      end
    end

    context "valid params provided" do

      it "be successful" do
        resp = RelinkApi::Jobs.create(job)
        id = resp.parsed_response["id"]

        params = {
          job_id:  id,
          profile: profile
        }

        resp = RelinkApi::Analyze.create(params)
        expect(resp.code).to eq(201)
      end
    end
  end

end
