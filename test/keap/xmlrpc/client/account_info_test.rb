require "test_helper"

describe Keap::XMLRPC::Client::AccountInfo do
  it "gets the account profile for the current user" do
    stub = stub_request(:get, "account/profile", response: stub_response(fixture: "account/info"))
    client = Keap::XMLRPC::Client.new(access_token: "fake", adapter: :test, stubs: stub)
    account = client.account_profile

    _(account.class).must_equal Keap::XMLRPC::AccountProfile
    _(account.email).must_equal "admin@example.com"
  end

  it "updates an account_profile"
end
