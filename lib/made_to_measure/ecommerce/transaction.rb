module MadeToMeasure::Ecommerce
  # https://developers.google.com/analytics/devguides/collection/protocol/v1/devguide#ecom
  #
  class Transaction < MadeToMeasure::Interaction
    attr_accessor :items

    def initialize(id:, client_id: nil, affiliation: nil, revenue: nil, shipping: nil, tax: nil, currency_code: nil)
      @id, @client_id, @affiliation, @revenue, @shipping, @tax, @currency_code =
      id, client_id, affiliation, revenue, shipping, tax, currency_code
      @items = []
    end

    def commit
      super

      @items.each do |item_attributes|
        params = item_attributes.merge(:transaction_id => @id,
          :client_id => @client_id, :currency_code => @currency_code)
        item = Item.new(params)
        item.commit
      end
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
