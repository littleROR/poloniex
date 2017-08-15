module Poloniex
  class VolumeEntry
    attr_reader :name, :first_coin_volume, :last_coin_volume, :first_coin_name, :last_coin_name

    def initialize(name, attributes)
      @name = name
      if name.start_with?('total')
        @first_coin_name = @last_coin_name = name.gsub('total', '')
        @first_coin_volume = @last_coin_volume = attributes
      else
        @first_coin_name, @last_coin_name = attributes.keys
        @first_coin_volume, @last_coin_volume = attributes.values
      end
    end
  end
end