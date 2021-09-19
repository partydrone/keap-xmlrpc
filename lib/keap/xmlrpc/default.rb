require "keap/xmlrpc/version"

module Keap
  module XMLRPC
    module Default
      API_ENDPOINT = "https://api.infusionsoft.com/crm/xmlrpc/v1".freeze
      AUTHORIZE_URL = "https://accounts.infusionsoft.com/app/oauth/authorize".freeze
      TOKEN_STORE = "Keap::XMLRPC::TokenStore".freeze
      TOKEN_URL = "https://api.infusionsoft.com/token".freeze
      USER_AGENT = "Keap XML-RPC Ruby Gem #{Keap::XMLRPC::VERSION}".freeze

      class << self
        def options
          Keap::XMLRPC::Configurable.keys.map { |key| [key, send(key)] }.to_h
        end

        def access_token
          ENV["KEAP_XMLRPC_ACCESS_TOKEN"] || ENV["KEAP_ACCESS_TOKEN"]
        end

        def api_endpoint
          ENV["KEAP_XMLRPC_API_ENDPOINT"] || API_ENDPOINT
        end

        def authorize_url
          ENV["KEAP_XMLRPC_AUTHORIZE_URL"] || AUTHORIZE_URL
        end

        def client_id
          ENV["KEAP_XMLRPC_CLIENT_ID"] || ENV["KEAP_CLIENT_ID"]
        end

        def client_secret
          ENV["KEAP_XMLRPC_CLIENT_SECRET"] || ENV["KEAP_CLIENT_SECRET"]
        end

        def redirect_uri
          ENV["KEAP_XMLRPC_REDIRECT_URI"] || ENV["KEAP_REDIRECT_URI"]
        end

        def token_store
          ENV["KEAP_XMLRPC_TOKEN_STORE"] || ENV["KEAP_TOKEN_STORE"] || TOKEN_STORE
        end

        def token_url
          ENV["KEAP_XMLRPC_TOKEN_URL"] || TOKEN_URL
        end

        def user_agent
          ENV["KEAP_XMLRPC_USER_AGENT"] || USER_AGENT
        end
      end
    end
  end
end
