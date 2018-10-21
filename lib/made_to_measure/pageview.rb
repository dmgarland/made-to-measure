# frozen_string_literal: true

module MadeToMeasure
  class Pageview < MadeToMeasure::Interaction
    def initialize(page:, title: nil, document_hostname: nil, client_id: nil)
      @page = page
      @title = title
      @document_hostname = document_hostname
      @client_id = client_id
    end

    def to_h
      super.merge(dp: @page, dt: @title, dh: @document_hostname)
    end
  end
end
