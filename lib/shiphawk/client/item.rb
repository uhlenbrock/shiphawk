module Shiphawk
  class Client
    module Item

      # Search for items
      def search_items(term)
        get "items/search/#{CGI::escape(term)}"
      end

      # Get item details
      def get_item(id)
        get "items/#{id}/details"
      end

    end
  end
end
