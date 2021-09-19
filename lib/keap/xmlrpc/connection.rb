module Keap
  module XMLRPC
    # Network layer for API clients.
    #
    module Connection
      # Connection object for the Keap API.
      #
      # @return [XMLRPC::Client]
      #
      def connection
        @connection ||= ::XMLRPC::Client.new3({
          host: endpoint.host,
          path: endpoint.request_uri,
          port: 443,
          use_ssl: true
        })

        @connection.http_header_extra = {"User-Agent": user_agent}
        @connection
      end

      # Response for the last HTTP request.
      #
      # @return []
      #
      def last_response
        @last_response if defined? @last_response
      end

      private

      def endpoint
        uri = URI(api_endpoint)
        @endpoint ||= URI::HTTPS.build(
          host: uri.host,
          path: uri.path,
          query: "access_token=#{token_store.get_token}"
        )
      end

      def request(service, *params)
        @last_response = response = connection.call(service, token_store.get_token, *params)
        response
      rescue Keap::XMLRPC::Error => error
        @last_response = nil
        raise error
      end
    end
  end
end
