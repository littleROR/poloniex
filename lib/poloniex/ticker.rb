module Poloniex
  class Ticker
    attr_reader :name, :id, :last, :lowest_ask, :highest_bid, :percent_change,
                :base_volume, :quote_volume, :is_frozen, :high24hr, :low24hr

    def initialize(name, attributes)
      @name = name
      attributes.each do |key, value|
        instance_variable_set("@#{key.to_underscore}", value)
      end
    end
  end
end