module Keap
  module XMLRPC
    class Client
      # The Affiliates service is used to pull commission data and activities
      # for affiliates. With this service, you have access to Clawbacks,
      # Commissions, Payouts, Running Totals, and the Activity Summary. The
      # methods in the Affiliates service mirror the reports produced inside
      # Infusionsoft. To manage affiliate information (i.e., Name, Phone, etc.)
      # You will need to use the <tt>DataService</tt>.
      #
      # @see https://developer.keap.com/docs/xml-rpc/#affiliate
      #   Keap XML-RPC API—Affiliate
      #
      module Affiliates
        # Retrieves all clawed back commissions for a particular affiliate. Claw
        # backs typically occur when an order has been refunded to the customer.
        #
        # @param affiliate_id [Integer] The <tt>:id</tt> number for the affiliate
        #   record for which you would like the claw backs.
        # @param starting_on [Date] The starting date for the date range for
        #   which you would like affiliate claw backs.
        # @param ending_on [Date] The ending date for the date range for which
        #   you would like the affiliate claw backs.
        #
        # @return [Array<AffiliateClawback>]
        #
        # @see https://developer.keap.com/docs/xml-rpc/#affiliate-retrieve-clawbacks
        #   Keap XML-RPC API—Retrieve Clawbacks
        #
        def affiliate_clawbacks(affiliate_id, starting_on:, ending_on:)
          response = request("APIAffiliateService.affClawbacks", affiliate_id, starting_on, ending_on)
          response.map { |fields| AffiliateClawback.new(fields) }
        end
        alias_method :retrieve_affiliate_clawbacks, :affiliate_clawbacks

        # Retrieves all commissions for a specific affiliate within a date range.
        #
        # @param affiliate_id [Integer] The <tt>:id</tt> number for the affiliate
        #   record for which you would like the commissions.
        # @param starting_on [Date] The starting date for the date range for
        #   which you would like affiliate commissions.
        # @param ending_on [Date] The ending date for the date range for which
        #   you would like the affiliate commissions.
        #
        # @return [Array<AffiliateCommission>]
        #
        # @see https://developer.keap.com/docs/xml-rpc/#affiliate-retrieve-commissions
        #   Keap XML-RPC API—Retrieve Commissions
        #
        def affiliate_commissions(affiliate_id, starting_on:, ending_on:)
          response = request("APIAffiliateService.affCommissions", affiliate_id, starting_on, ending_on)
          response.map { |fields| AffiliateCommission.new(fields) }
        end
        alias_method :retrieve_affiliate_commissions, :affiliate_commissions

        # Retrieves all payments for a specific affiliate within a date range.
        #
        # @param affiliate_id [Integer] The <tt>:id</tt> number for the affiliate
        #   record for which you would like the payments.
        # @param starting_on [Date] The starting date for the date range for
        #   which you would like affiliate payments.
        # @param ending_on [Date] The ending date for the date range for which
        #   you would like the affiliate payments.
        #
        # @return [Array<AffiliatePayment>]
        #
        # @see https://developer.keap.com/docs/xml-rpc/#affiliate-retrieve-payments
        #   Keap XML-RPC API—Retrieve Payments
        #
        def affiliate_payments(affiliate_id, starting_on:, ending_on:)
          response = request("APIAffiliateService.affPayouts", affiliate_id, starting_on, ending_on)
          response.map { |fields| AffiliatePayment.new(fields) }
        end
        alias_method :retrieve_affiliate_payments, :affiliate_payments

        # Retrieves a list of the redirect links for the specified Affiliate.
        #
        # @param affiliate_id [Integer] The <tt>:id</tt> for the affiliate record for which you would like the redirect links.
        #
        # @return [Array<AffiliateRedirectLink>]
        #
        # @see https://developer.keap.com/docs/xml-rpc/#affiliate-retrieve-redirect-links
        #   Keap XML-RPC API—Retrieve Redirect Links
        #
        def affiliate_redirect_links(affiliate_id)
          response = request("AffiliateService.getRedirectLinksForAffiliate", affiliate_id)
          response.map { |fields| AffiliateRedirectLink.new(fields) }
        end
        alias_method :retrieve_affiliate_redirect_links, :affiliate_redirect_links

        # Retrieves all payments for a specific affiliate within a date range.
        #
        # @param affiliate_ids [Array<Integer>] An array of affiliate <tt>:id</tt>
        #   numbers for which you would like stats.
        # @param starting_on [Date] The starting date for the date range for
        #   which you would like affiliate stats.
        # @param ending_on [Date] The ending date for the date range for which
        #   you would like the affiliate stats.
        #
        # @return [Array<AffiliateSummary>]
        #
        # @see https://developer.keap.com/docs/xml-rpc/#affiliate-retrieve-a-summary-of-affiliate-statistics
        #   Keap XML-RPC API—Retrieve a Summary of Affiliate Statistics
        #
        def affiliate_summaries(affiliate_ids, starting_on:, ending_on:)
          response = request("APIAffiliateService.affSummary", affiliate_ids, starting_on, ending_on)
          response.map { |fields| AffiliateSummary.new(fields) }
        end
        alias_method :retrieve_affiliate_summaries, :affiliate_summaries

        def affiliate_running_totals(affiliate_ids)
          response = request("APIAffiliateService.affRunningTotals", affiliate_ids)
          response.map { |fields| AffiliateRunningTotal.new(fields) }
        end
      end
    end
  end
end
