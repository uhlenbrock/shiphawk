module Shiphawk
  class Client
    module Item

      # Search for items
      def search_items(term)
        get "items/search/#{term}"
      end

    end
  end
end
