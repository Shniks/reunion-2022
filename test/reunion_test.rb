require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/reunion'

class ReunionTest < Minitest::Test

  def test_if_it_exists
    reunion = Reunion.new("1406 BE")

    assert_instance_of Reunion, reunion
  end

  def test_if_it_has_attributes
    reunion = Reunion.new("1406 BE")

    assert_equal "1406 BE", reunion.name
    assert_instance_of Array, reunion.activities
  end

  def test_if_it_can_add_activities
    reunion = Reunion.new("1406 BE")
    activity_1 = Activity.new("Brunch")
    reunion.add_activity(activity_1)

    assert_instance_of Activity, activity_1
    assert_equal [activity_1], reunion.activities
  end

end
