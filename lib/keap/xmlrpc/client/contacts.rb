module Keap
  module XMLRPC
    class Client
      module Contacts
        # Creates a new contact record from the data passed in.
        #
        # @param **attributes [Hash] The data for this new contact record.
        #
        # @return [Integer] The <tt>:id</tt> of the new contact record.
        #
        def create_contact(**attributes)
          attributes.transform_keys! { |key| Thor::Util.camel_case(key.to_s).to_sym }
          request("ContactService.add", attributes)
        end

        # Retrieves all contacts with the given email address. This searches
        # Email, Email 2, and Email 3 fields.
        #
        # @param email [String] The email address to search for.
        # @param fields [Array] The contact fields to return. An empty array
        #   returns <tt>:id</tt> by default.
        #
        # @return [Array<Contact>]
        #
        def find_contact_by_email(email, fields: [])
          fields.map! { |f| Thor::Util.camel_case(f.to_s).to_sym }
          response = request("ContactService.findByEmail", email, fields)
          response.map { |fields| Contact.new(fields) }
        end
      end
    end
  end
end
