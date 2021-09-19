module Keap
  module XMLRPC
    class Error < StandardError
      class << self
        def from_response(response)
          status = response.status

          if (klass = case status
              when 400 then Keap::XMLRPC::BadRequest
              when 401 then Keap::XMLRPC::Unauthorized
              when 403 then Keap::XMLRPC::Forbidden
              when 404 then Keap::XMLRPC::NotFound
              when 422 then Keap::XMLRPC::UnprocessableEntity
              when 400..499 then Keap::XMLRPC::ClientError
              when 500 then Keap::XMLRPC::InternalServerError
              when 503 then Keap::XMLRPC::ServiceUnavailable
              when 500..599 then Keap::XMLRPC::ServerError
              end)
            klass.new(response)
          end
        end
      end

      def initialize(response = nil)
        @response = response
        super(build_error_message)
      end

      private

      def build_error_message
        return nil if @response.nil?

        message = "#{@response.method.to_s.upcase} "
        message << "#{@response.url}: "
        message << "#{@response.status} - "
        message << @response.body["message"].to_s if @response.body["message"]
        message << (@response.body["fault"]["faultstring"]).to_s if @response.body["fault"]
        message << "\n\n#{@response.body}\n\n"

        message
      end
    end

    class ClientError < Error; end

    class BadRequest < ClientError; end

    class Unauthorized < ClientError; end

    class Forbidden < ClientError; end

    class NotFound < ClientError; end

    class UnprocessableEntity < ClientError; end

    class ServerError < Error; end

    class InternalServerError < ServerError; end

    class ServiceUnavailable < ServerError; end
  end
end
