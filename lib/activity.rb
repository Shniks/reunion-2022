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





end
