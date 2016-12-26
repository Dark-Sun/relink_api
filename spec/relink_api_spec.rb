require "spec_helper"

describe RelinkApi do
  it "has a version number" do
    expect(RelinkApi::VERSION).not_to be nil
  end

  it "should have #client method" do
    expect(RelinkApi.respond_to?(:client)).to eq(true)
  end
end
