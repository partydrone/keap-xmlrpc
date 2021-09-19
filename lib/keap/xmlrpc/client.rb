module Keap
  module XMLRPC
    # Client for the Keap XMLRPC API.
    #
    class Client
      autoload :Affiliates, "keap/xmlrpc/client/affiliates"
      autoload :AffiliatePrograms, "keap/xmlrpc/client/affiliate_programs"
      autoload :Contacts, "keap/xmlrpc/client/contacts"
      autoload :Data, "keap/xmlrpc/client/data"
      autoload :Discounts, "keap/xmlrpc/client/discounts"
      autoload :Emails, "keap/xmlrpc/client/emails"
      autoload :Files, "keap/xmlrpc/client/files"
      autoload :Funnels, "keap/xmlrpc/client/funnels"
      autoload :Invoices, "keap/xmlrpc/client/invoices"
      autoload :Orders, "keap/xmlrpc/client/orders"
      autoload :Products, "keap/xmlrpc/client/products"
      autoload :Search, "keap/xmlrpc/client/search"
      autoload :Shipping, "keap/xmlrpc/client/shipping"
      autoload :Webforms, "keap/xmlrpc/client/webforms"

      include Keap::XMLRPC::Configurable
      include Keap::XMLRPC::Connection
      include Keap::XMLRPC::Client::Affiliates
      include Keap::XMLRPC::Client::AffiliatePrograms
      include Keap::XMLRPC::Client::Contacts
      include Keap::XMLRPC::Client::Data
      include Keap::XMLRPC::Client::Discounts
      include Keap::XMLRPC::Client::Emails
      include Keap::XMLRPC::Client::Files
      include Keap::XMLRPC::Client::Invoices
      include Keap::XMLRPC::Client::Orders
      include Keap::XMLRPC::Client::Products
      include Keap::XMLRPC::Client::Search
      include Keap::XMLRPC::Client::Shipping
      include Keap::XMLRPC::Client::Webforms

      def initialize(options = {})
        Keap::XMLRPC::Configurable.keys.each do |key|
          value = options.key?(key) ? options[key] : Keap::XMLRPC.instance_variable_get(:"@#{key}")
          instance_variable_set(:"@#{key}", value)
        end
      end

      # Text representation of the client, masking tokens.
      #
      # @return [String]
      #
      def inspect
        inspected = super

        inspected.gsub!(@access_token, "#{"*" * 24}#{@access_token[24..-1]}") if @access_token # standard:disable Style/SlicingWithRange
        inspected.gsub!(@client_secret, "#{"*" * 12}#{@client_secret[12..-1]}") if @client_secret # standard:disable Style/SlicingWithRange

        inspected
      end
    end
  end
end
