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

  def test_if_it_can_compute_total_cost_for_one_activity
    reunion = Reunion.new("1406 BE")
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)
    reunion.add_activity(activity_1)

    assert_equal 60, reunion.total_cost
  end

  def test_if_it_can_compute_total_cost_for_two_activities
    reunion = Reunion.new("1406 BE")
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)
    reunion.add_activity(activity_1)
    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)
    reunion.add_activity(activity_2)

    assert_equal 180, reunion.total_cost
  end

  def test_if_it_can_provide_a_breakout_by_participant
    reunion = Reunion.new("1406 BE")
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)
    reunion.add_activity(activity_1)
    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)
    reunion.add_activity(activity_2)

    assert_equal ({"Maria" => -10, "Luther" => -30, "Louis" => 40}), reunion.breakout
  end

  def test_if_it_can_provide_summary_of_breakout_per_participant
    reunion = Reunion.new("1406 BE")
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)
    reunion.add_activity(activity_1)
    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)
    reunion.add_activity(activity_2)

    assert_equal "Maria: -10\nLuther: -30\nLouis: 40\n", reunion.summary
  end

end
