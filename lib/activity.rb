require 'pry'

class Activity

  attr_reader :name,
              :participants,
              :amount_owed

  def initialize(activity)
    @name = activity
    @participants = {}
    @amount_owed = {}
  end

  def add_participant(participant, cost)
    participants[participant] = cost
  end

  def total_cost
    participants.values.sum
  end

  def split
    total_cost / participants.keys.count
  end

  def owed
    participants.each do |participant, paid|
      amount_owed[participant] = (split - paid)
    end
    amount_owed
  end

end
