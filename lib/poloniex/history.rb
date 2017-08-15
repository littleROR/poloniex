module Poloniex
  class History
    attr_reader :date, :high, :low, :open, :close, :volume, :quote_volume, :weighted_average
    
    def []=(*options)
      key, value = normalize(*options)
      self.instance_variable_set("@#{key.to_underscore}", value)
    end

    def to_hash
      instance_variables.inject(Hash.new) do |result, var|
          result[var.to_s.gsub("@", "").to_sym] = instance_variable_get(var)
          result
      end
    end

    private

    def normalize(*options)
      k, v = options
      if k == 'date'
        v = Time.at(v).to_datetime.to_s
      end

      [k, v]
    end
  end
end