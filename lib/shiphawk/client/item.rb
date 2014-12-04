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

      # Suggest a ShipHawk item
      # Requires: name, width, height, length, value, width
      def suggest_item(options={})
        post "items/suggest", options
      end

    end
  end
end
