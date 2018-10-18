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

    def user_agent
      "MadeToMeasure/#{MadeToMeasure::VERSION} (+https://github.com/dmgarland/made-to-measure)"
    end

    def commit
      self.class.post("/collect", {
        headers: { "User-Agent" => user_agent },
        query: to_h
      })
    end
  end
end