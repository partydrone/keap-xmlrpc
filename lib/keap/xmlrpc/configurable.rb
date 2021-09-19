module Keap
  module XMLRPC
    module Configurable
      # @!attribute access_token
      #   @return [String] OAuth2 access token for authentication.
      # @!attribute adapter
      #   @return [Faraday::Adapter] HTTP library adapter.
      attr_accessor :access_token, :api_endpoint, :authorize_url, :client_id, :client_secret, :redirect_uri, :token_url, :user_agent
      attr_writer :token_store

      class << self
        def keys
          @keys ||= [
            :access_token,
            :api_endpoint,
            :authorize_url,
            :client_id,
            :client_secret,
            :redirect_uri,
            :token_store,
            :token_url,
            :user_agent
          ]
        end
      end

      def configure
        yield self
      end

      def reset!
        Keap::XMLRPC::Configurable.keys.each do |key|
          instance_variable_set(:"@#{key}", Keap::XMLRPC::Default.options[key])
        end

        self
      end
      alias_method :setup, :reset!

      def same_options?(opts)
        opts.hash == options.hash
      end

      def token_store
        Object.const_get @token_store
      end

      private

      def options
        Keap::XMLRPC::Configurable.keys.map { |key| [key, instance_variable_get(:"@#{key}")] }.to_h
      end
    end
  end
end
