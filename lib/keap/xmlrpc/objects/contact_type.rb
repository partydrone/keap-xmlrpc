module Keap
  module XMLRPC
    class ContactType < Object
      def to_s
        value
      end

      def to_a
        value.split(",")
      end
    end
  end
end
