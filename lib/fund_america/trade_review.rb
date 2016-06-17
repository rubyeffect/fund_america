module FundAmerica
  class TradeReview
    class << self

      # End point: https://apps.fundamerica.com/api/trade_reviews (GET)
      # Usage: FundAmerica::TradeReview.list
      # Output: Returns list of trade_reviews
      def list
        API::request(:get, 'trade_reviews')
      end

      # End point: https://sandbox.fundamerica.com/api/test_mode/trade_reviews/:id (PATCH)
      # Usage: FundAmerica::TradeReview.update(trade_review_id, options)
      # Output: Updates a trade_review
      # Important: This works only for Sandbox mode
      def update(trade_review_id, options)
        end_point_url = 'https://sandbox.fundamerica.com/api/test_mode/trade_reviews/' + trade_review_id
        API::request(:patch, end_point_url, options)
      end

      # End point: https://apps.fundamerica.com/api/trade_reviews/:id (GET)
      # Usage: FundAmerica::TradeReview.details(trade_review_id)
      # Output: Returns the details of an trade_review with matching id
      def details(trade_review_id)
        API::request(:get, "trade_reviews/#{trade_review_id}")
      end

    end
  end
end
