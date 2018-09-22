module MadeToMeasure
  class << self
    attr_accessor :version, :property_id

    def config(&block)
      self.instance_eval &block
    end
  end
end
