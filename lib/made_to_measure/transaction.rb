module MadeToMeasure
  # https://developers.google.com/analytics/devguides/collection/protocol/v1/devguide#ecom
  #
  class Transaction < Interaction
    include HTTParty
    base_uri 'https://www.google-analytics.com'

    def initialize(id:, client_id: nil, affiliation: nil, revenue: nil, shipping: nil, tax: nil, currency_code: nil)
      @id, @client_id, @affiliation, @revenue, @shipping, @tax, @currency_code =
      id, client_id, affiliation, revenue, shipping, tax, currency_code
    end

    def to_h
      super.merge({
        ti: @id,
        ta: @affiliation,
        tr: @revenue,
        ts: @shipping,
        tt: @tax,
        cu: @currency_code
      })
    end
  end
end
