# frozen_string_literal: true
require 'my_garage/base_car'
require 'my_garage/camaro'
require 'my_garage/version'
require 'thread'

module MyGarage

  class << self
    def go_for_a_ride
      puts 'A Camaro emerges from the garage'
    end
  end

end
