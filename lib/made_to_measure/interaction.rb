module MadeToMeasure
  class Interaction
    include HTTParty
    base_uri 'https://www.google-analytics.com'

    def to_h
      {
        v: MadeToMeasure.version || 1,
        tid: MadeToMeasure.property_id,
        t: self.class.name.split('::').last.downcase,
        cid: @client_id || SecureRandom.uuid
      }
    end

    def commit
      self.class.post("/collect", { query: to_h })
    end
  end
end