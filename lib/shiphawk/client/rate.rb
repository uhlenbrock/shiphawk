module Shiphawk
  class Client
    module Rate

      FROM_TYPES   = %w[tradeshow construction_site limited_access terminal commercial residential]
      TO_TYPES     = %w[tradeshow construction_site limited_access terminal commercial residential]
      RATE_FILTERS = %w[min_rate fastest top_10]

      # Get rate quotes
      def get_rates(options = {})
        post 'rates', options
      end

    end
  end
end
