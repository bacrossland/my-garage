# frozen_string_literal: true
require 'my_garage/cars/base_car'
require 'my_garage/cars/camaro'
require 'my_garage/cars/mustang'
require 'my_garage/version'
require 'thread'

module MyGarage
  def self.go_for_a_ride
    car = Camaro.new
    car.go_for_a_ride
  end

  def self.list_cars
    list_of_cars = []
    arr = Dir['lib/my_garage/cars/*.rb']
    arr.delete('lib/my_garage/cars/base_car.rb')
    arr.each do |car|
      list_of_cars << car.gsub('lib/my_garage/cars/','').gsub('.rb','').gsub('_','').capitalize
    end
    return list_of_cars
  end
end
