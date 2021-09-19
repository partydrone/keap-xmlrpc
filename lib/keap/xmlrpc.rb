# frozen_string_literal: true

require "faraday"
require "faraday_middleware"

module Keap
  # Ruby toolkit for the Keap XML-RPC API.
  #
  module XMLRPC
    autoload :Client, "keap/xmlrpc/client"
    autoload :Collection, "keap/xmlrpc/collection"
    autoload :Configurable, "keap/xmlrpc/configurable"
    autoload :Connection, "keap/xmlrpc/connection"
    autoload :Default, "keap/xmlrpc/default"
    autoload :Error, "keap/xmlrpc/error"
    autoload :MerchantsCollection, "keap/xmlrpc/merchants_collection"
    autoload :Object, "keap/xmlrpc/object"
    autoload :Response, "keap/xmlrpc/response"
    autoload :Token, "keap/xmlrpc/token"
    autoload :TokenStore, "keap/xmlrpc/token_store"

    # Classes used to return a nicer object wrapping the response data
    autoload :AccountProfile, "keap/xmlrpc/objects/account_profile"
    autoload :Affiliate, "keap/xmlrpc/objects/affiliate"
    autoload :AffiliateClawback, "keap/xmlrpc/objects/affiliate_clawback"
    autoload :AffiliateCommission, "keap/xmlrpc/objects/affiliate_commission"
    autoload :AffiliatePayment, "keap/xmlrpc/objects/affiliate_payment"
    autoload :AffiliateProgram, "keap/xmlrpc/objects/affiliate_program"
    autoload :AffiliateRedirect, "keap/xmlrpc/objects/affiliate_redirect"
    autoload :AffiliateSummary, "keap/xmlrpc/objects/affiliate_summary"
    autoload :Appointment, "keap/xmlrpc/objects/appointment"
    autoload :Campaign, "keap/xmlrpc/objects/campaign"
    autoload :Company, "keap/xmlrpc/objects/company"
    autoload :Contact, "keap/xmlrpc/objects/contact"
    autoload :Email, "keap/xmlrpc/objects/email"
    autoload :EmailAddress, "keap/xmlrpc/objects/email_address"
    autoload :File, "keap/xmlrpc/objects/file"
    autoload :HookSubscription, "keap/xmlrpc/objects/hook_subscription"
    autoload :MerchantAccount, "keap/xmlrpc/objects/merchant_account"
    autoload :Note, "keap/xmlrpc/objects/note"
    autoload :Opportunity, "keap/xmlrpc/objects/opportunity"
    autoload :Order, "keap/xmlrpc/objects/order"
    autoload :OrderItem, "keap/xmlrpc/objects/order_item"
    autoload :OrderPayPlan, "keap/xmlrpc/objects/order_pay_plan"
    autoload :OrderPayment, "keap/xmlrpc/objects/order_payment"
    autoload :OrderTransaction, "keap/xmlrpc/objects/order_transaction"
    autoload :Product, "keap/xmlrpc/objects/product"
    autoload :ProductImage, "keap/xmlrpc/objects/product_image"
    autoload :ProductSubscription, "keap/xmlrpc/objects/product_subscription"
    autoload :Stage, "keap/xmlrpc/objects/stage"
    autoload :Subscription, "keap/xmlrpc/objects/subscription"
    autoload :Tag, "keap/xmlrpc/objects/tag"
    autoload :TagCategory, "keap/xmlrpc/objects/tag_category"
    autoload :Task, "keap/xmlrpc/objects/task"
    autoload :User, "keap/xmlrpc/objects/user"
    autoload :UserInfo, "keap/xmlrpc/objects/user_info"

    class << self
      include Keap::XMLRPC::Configurable

      # API client based on configured options {Configurable}
      #
      # @return [Keap::XMLRPC::Client] API wrapper
      #
      def client
        return @client if defined?(@client) && @client.same_options?(options)
        @client = Keap::XMLRPC::Client.new(options)
      end
    end
  end
end

Keap::XMLRPC.setup
