require "car_model/version"
require 'json'

module CarModel
  
  @@data = JSON.parse(File.read(File.join(File.dirname(File.expand_path(__FILE__)), 'car_model/data.json'))).freeze
  
  def self.all
    filtered_data.values.map { |data| Car.new(data) }
  end
  
  def self.find(id)
    check_argument(id)
    Car.new(filtered_data[id.to_s])
  end
  
  def self.first
    Car.new(@@data[@@data["first"]])
  end
  
  def self.last
     Car.new(@@data[@@data["last"]])   
  end  
  class Car
    
    attr_accessor :id, :name, :brand, :price
    
    def initialize(data)
      self.id = data["id"]
      self.name = data["name"]
      self.brand = data["brand"]
      self.price = data["price"]
    end
  end

private

  def self.check_argument(id)
    raise ArgumentError.new("wrong argument provided") unless id.is_a?(Integer)
    raise ArgumentError.new("wrong argument provided") unless (1..10).include?(id)
  end
  
  def self.filtered_data
    @@data.reject { |k,_| ["first", "last"].include?(k) }
  end

end
