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




end
