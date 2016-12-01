require 'minitest/autorun'
require 'car_model'

class CarModelTest < Minitest::Test
  def test_find_should_raise_error_when_string_is_provided
    assert_raises ArgumentError do
      CarModel.find('A')
    end

    assert_raises ArgumentError do
      CarModel.find('0')
    end
  end

  def test_find_should_raise_error_when_argument_is_greather_than_10
    assert_raises ArgumentError do
      CarModel.find(11)
    end
  end

  def test_find_should_raise_error_when_argument_is_lower_than_1
    assert_raises ArgumentError do
      CarModel.find(0)
    end

    assert_raises ArgumentError do
      CarModel.find(-1)
    end
  end

  def test_find_for_valid_arg_should_return_car
    assert_equal CarModel.find(1).class, CarModel::Car
  end

  def test_find_for_valid_arg_should_return_car_filled_with_args
    car = CarModel.find(1)

    assert_equal car.id, 1
    assert_equal car.name, 'Up'
    assert_equal car.brand, 'Volkswagen'
    assert_equal car.price, 36_930
  end

  def test_first_should_return_first_car
    assert_equal CarModel.first.id, 1
  end

  def test_last_should_return_last_car
    assert_equal CarModel.last.id, 10
  end

  def test_all_should_return_all_cars
    assert_equal CarModel.all.size, 10
    assert_equal CarModel.all.class, Array
  end
end
