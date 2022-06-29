require 'pry'
require './lib/activity'

class Reunion
  attr_reader :name,
              :activities,
              :total_owed

  def initialize(name)
    @name = name
    @activities = []
    @total_owed = Hash.new(0)
  end

  def add_activity(activity)
    activities << activity
  end

  def total_cost
    activities.reduce(0) do |total_cost, activity|
      total_cost + activity.total_cost
    end
  end

  def breakout
    activities.each do |activity|
      owed_by_participant(activity)
    end
    @total_owed
  end

  def owed_by_participant(activity)
    activity.participants.each do |participant, owed|
      @total_owed[participant] += activity.owed[participant]
    end
  end

  def summary
    breakout.reduce("") do |summary, participant|
      summary + "#{participant[0]}: #{participant[1]}\n"
    end
  end

end
