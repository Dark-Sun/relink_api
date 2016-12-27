require "spec_helper"

describe RelinkApi::Social do

  WebMock.disable!

  before do
    RelinkApi.configure do |config|
      config.api_key    = "69813590-96a3-11e6-98ad-e5869d07bac4"
      config.api_secret = "NzNlNTY3MDMtZTg4NC00YzMyLThjMTEtMGZhN2E4OWJlODE2"
      config.account_id = "5861368fc2757d0011a78e4b"
    end

    RelinkApi.authenticate
  end

  context "#show" do
    context "genue email provided" do

      it "be successful" do
        resp = RelinkApi::Social.show(email: 'darksun.darksun@gmail.com')
        expect(resp.code).to eq(200)
      end
    end
  end

end
