require "test_helper"

describe Keap::XMLRPC::Client do
  subject { Keap::XMLRPC::Client }

  before do
    Keap::XMLRPC.reset!
  end

  after do
    Keap::XMLRPC.reset!
  end

  describe "module configuration" do
    before do
      Keap::XMLRPC.reset!
      Keap::XMLRPC.configure do |config|
        Keap::XMLRPC::Configurable.keys.each do |key|
          config.send("#{key}=", "Some #{key}")
        end
      end
    end

    after do
      Keap::XMLRPC.reset!
    end

    it "inherits the module configuration" do
      client = subject.new

      Keap::XMLRPC::Configurable.keys.each do |key|
        _(client.instance_variable_get(:"@#{key}")).must_equal "Some #{key}"
      end
    end

    describe "with class-level configuration" do
      before do
        @options = {
          access_token: "some-new-access_token",
          authorize_url: "https://api.bogus.zzz/auth"
        }
      end

      it "overrides module configuration" do
        client = subject.new(@options)

        _(client.access_token).must_equal "some-new-access_token"
        _(client.authorize_url).must_equal "https://api.bogus.zzz/auth"
        _(client.token_url).must_equal Keap::XMLRPC.token_url
      end

      it "can set configuration after initialization" do
        client = subject.new
        client.configure do |config|
          @options.each do |key, value|
            config.send("#{key}=", value)
          end
        end

        _(client.access_token).must_equal "some-new-access_token"
        _(client.authorize_url).must_equal "https://api.bogus.zzz/auth"
        _(client.token_url).must_equal Keap::XMLRPC.token_url
      end

      it "masks tokens on inspect" do
        client = subject.new(access_token: "OPExnRuUZtQe6I9QtSNY5j5BrrnU")
        inspected = client.inspect
        _(inspected).wont_include "OPExnRuUZtQe6I9QtSNY5j5BrrnU"
      end

      it "masks client_secret on inspect" do
        client = subject.new(client_secret: "lTQGNuoaYMLwFO9r")
        inspected = client.inspect
        _(inspected).wont_include "lTQGNuoaYMLwFO9r"
      end
    end
  end

  describe ".last_response" do
    it "caches the last agent response" do
      Keap::XMLRPC.reset!
      client = subject.new(access_token: "fake")

      _(client.last_response).must_be_nil

      client.find_contact_by_email("peter.parker@example.com")

      _(client.last_response.status).must_equal 200
    end
  end
end
