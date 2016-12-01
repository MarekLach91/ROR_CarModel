require 'car_model/version'
require 'json'

module CarModel
  @data = JSON.parse(File.read(DATA_PATH)).freeze

  def self.all
    filtered_data.values.map { |data| Car.new(data) }
  end

  def self.find(id)
    check_argument(id)
    Car.new(filtered_data[id.to_s])
  end

  def self.first
    Car.new(@data[@data['first']])
  end

  def self.last
    Car.new(@data[@data['last']])
  end

  def self.check_argument(id)
    raise ArgumentError, 'wrong argument provided' unless id.is_a?(Integer)
    raise ArgumentError, 'wrong argument provided' unless (1..10).cover?(id)
  end

  def self.filtered_data
    @data.reject { |k, _| %w(first last).include?(k) }
  end

  private_class_method :check_argument
  private_class_method :filtered_data

  class Car
    attr_accessor :id, :name, :brand, :price

    def initialize(data)
      self.id = data['id']
      self.name = data['name']
      self.brand = data['brand']
      self.price = data['price']
    end
  end
end
