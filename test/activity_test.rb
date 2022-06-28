require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/activity'

class ActivityTest < Minitest::Test

  def test_if_it_exists
    activity = Activity.new("Brunch")

    assert_instance_of Activity, activity
  end

  def test_if_it_has_attributes
    activity = Activity.new("Brunch")

    assert_equal "Brunch", activity.name
    assert_instance_of Hash, activity.participants
  end

  def test_it_can_add_a_participant
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)

    assert_equal ({"Maria" => 20}), activity.participants
    assert_equal 20, activity.total_cost
  end

  def test_it_can_add_another_participant
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)

    assert_equal ({"Maria" => 20, "Luther" => 40}), activity.participants
    assert_equal 60, activity.total_cost
  end





end
