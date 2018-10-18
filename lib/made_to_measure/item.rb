module MadeToMeasure
  # https://developers.google.com/analytics/devguides/collection/protocol/v1/devguide#ecom
  #
  class Item < Interaction
    def initialize(transaction_id:, client_id:, name:, price: nil, quantity: nil, sku: nil, variant: nil, currency_code: nil)
      @transaction_id, @client_id, @name, @price , @quantity , @sku , @variant , @currency_code =
      transaction_id, client_id, name, price , quantity , sku , variant , currency_code
    end

    def to_h
      super.merge({
        ti: @transaction_id,
        in: @name,
        ip: @price,
        iq: @quantity,
        ic: @sku,
        iv: @variant,
        cu: @currency_code
      })
    end
  end
end
