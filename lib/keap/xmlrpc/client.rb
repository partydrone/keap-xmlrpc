module Keap
  module XMLRPC
    # Client for the Keap XMLRPC API.
    #
    class Client
      autoload :AccountInfo, "keap/xmlrpc/client/account_info"
      autoload :Affiliates, "keap/xmlrpc/client/affiliates"
      autoload :Appointments, "keap/xmlrpc/client/appointments"
      autoload :Campaigns, "keap/xmlrpc/client/campaigns"
      autoload :Companies, "keap/xmlrpc/client/companies"
      autoload :Contacts, "keap/xmlrpc/client/contacts"
      autoload :EmailAddresses, "keap/xmlrpc/client/email_addresses"
      autoload :Emails, "keap/xmlrpc/client/emails"
      autoload :Files, "keap/xmlrpc/client/files"
      autoload :Hooks, "keap/xmlrpc/client/hooks"
      autoload :Locale, "keap/xmlrpc/client/locale"
      autoload :Merchants, "keap/xmlrpc/client/merchants"
      autoload :Notes, "keap/xmlrpc/client/notes"
      autoload :Opportunities, "keap/xmlrpc/client/opportunities"
      autoload :Orders, "keap/xmlrpc/client/orders"
      autoload :Products, "keap/xmlrpc/client/products"
      autoload :Settings, "keap/xmlrpc/client/settings"
      autoload :Subscriptions, "keap/xmlrpc/client/subscriptions"
      autoload :Tags, "keap/xmlrpc/client/tags"
      autoload :Tasks, "keap/xmlrpc/client/tasks"
      autoload :Transactions, "keap/xmlrpc/client/transactions"
      autoload :UserInfo, "keap/xmlrpc/client/user_info"
      autoload :Users, "keap/xmlrpc/client/users"

      include Keap::XMLRPC::Configurable
      include Keap::XMLRPC::Connection
      include Keap::XMLRPC::Client::AccountInfo
      include Keap::XMLRPC::Client::Affiliates
      include Keap::XMLRPC::Client::Appointments
      include Keap::XMLRPC::Client::Campaigns
      include Keap::XMLRPC::Client::Companies
      include Keap::XMLRPC::Client::Contacts
      include Keap::XMLRPC::Client::EmailAddresses
      include Keap::XMLRPC::Client::Emails
      include Keap::XMLRPC::Client::Files
      include Keap::XMLRPC::Client::Hooks
      include Keap::XMLRPC::Client::Locale
      include Keap::XMLRPC::Client::Merchants
      include Keap::XMLRPC::Client::Notes
      include Keap::XMLRPC::Client::Opportunities
      include Keap::XMLRPC::Client::Orders
      include Keap::XMLRPC::Client::Products
      include Keap::XMLRPC::Client::Settings
      include Keap::XMLRPC::Client::Subscriptions
      include Keap::XMLRPC::Client::Tags
      include Keap::XMLRPC::Client::Tasks
      include Keap::XMLRPC::Client::Transactions
      include Keap::XMLRPC::Client::UserInfo
      include Keap::XMLRPC::Client::Users

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
