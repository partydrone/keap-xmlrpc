# require "faraday"
# require "keap/rest/error"

module Keap
  module XMLRPC
    module Response
      class RaiseError < Faraday::Middleware
        def on_complete(response)
          if (error = Keap::XMLRPC::Error.from_response(response))
            raise error
          end
        end
      end
    end
  end
end
