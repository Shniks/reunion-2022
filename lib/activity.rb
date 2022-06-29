require 'pry'

class Activity

  attr_reader :name,
              :participants

  def initialize(activity)
    @name = activity
    @participants = {}
  end

  def add_participant(participant, cost)
    @participants[participant] = cost
  end

  def total_cost
    @participants.values.sum
  end

  def split
    total_cost / @participants.keys.count
  end

end
