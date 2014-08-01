module Shiphawk
  class Client
    module Item

      # Search for items
      def search(term)
        get "items/search/#{term}"
      end

    end
  end
end
