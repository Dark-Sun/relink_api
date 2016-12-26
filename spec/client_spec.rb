require "spec_helper"

describe RelinkApi::Client do

  before do
    @client = RelinkApi.client

    stub_request(:get, "http://marlowe.relinklabs.com/token").
           to_return(status: 422, headers: {}, body: "")

    stub_request(:get, "http://marlowe.relinklabs.com/token").
           with(headers: {'Authorization'=>'Basic Njk4MTM1OTAtOTZhMy0xMWU2LTk4YWQtZTU4NjlkMDdiYWM0Ok56TmxOVFkzTURNdFpUZzROQzAwWXpNeUxUaGpNVEV0TUdaaE4yRTRPV0psT0RFMg=='}).
           to_return(status: 200, headers: {}, body: "{\"token\":\"sample_token\"}")
  end

  it "should be a singleton" do
    expect(@client).to eq(RelinkApi.client)
  end

  context "given right API credentials" do

    before do
      RelinkApi.configure do |config|
        config.api_key    = "69813590-96a3-11e6-98ad-e5869d07bac4"
        config.api_secret = "NzNlNTY3MDMtZTg4NC00YzMyLThjMTEtMGZhN2E4OWJlODE2"
      end
    end

    context "#authenticate" do
      it "should respond" do
        expect(@client.respond_to?(:authenticate)).to eq(true)
      end

      it "should set token" do
        @client.authenticate
        expect(@client.token).not_to eq(nil)
      end
    end
  end

  context "givent no API credentials" do

    before do
      RelinkApi.configure do |config|
        config.api_key    = nil
        config.api_secret = nil
      end
    end

    context "#authenticate" do
      it "should raise error" do
        expect { @client.authenticate }.to raise_error(RelinkApi::MissingAPICredentials)
      end
    end
  end

  context "givent wrong API credentials" do

    before do
      RelinkApi.configure do |config|
        config.api_key    = "wrong_key"
        config.api_secret = "wrong_secret"
      end
    end

    context "#authenticate" do
      it "should raise error" do
        expect { @client.authenticate }.to raise_error(RelinkApi::AuthenticationError)
      end
    end
  end


end
