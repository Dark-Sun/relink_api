require "spec_helper"

describe RelinkApi::Configuration do

  TEST_KEY        = "test_key"
  TEST_SECRET     = "test_secret"
  TEST_URL        = "example.com"
  TEST_ACCOUNT_ID = "12345"

  before do
    RelinkApi.config do |config|
      config.api_key          = TEST_KEY
      config.api_secret       = TEST_SECRET
      config.notification_url = TEST_URL
      config.account_id       = TEST_ACCOUNT_ID
    end
  end

  it "should set API key" do
    expect(RelinkApi.Configuration.api_key).to eq(TEST_KEY)
  end

  it "should set API secret" do
    expect(RelinkApi.Configuration.api_secret).to eq(TEST_SECRET)
  end

  it "should set notification URL" do
    expect(RelinkApi.Configuration.notification_url).to eq(TEST_URL)
  end

  it "should an account id" do
    expect(RelinkApi.Configuration.account_id).to eq(TEST_ACCOUNT_ID)
  end

end
