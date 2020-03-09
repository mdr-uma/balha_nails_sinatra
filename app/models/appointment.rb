class Appointment < ActiveRecord::Base
    belongs_to :client

    # def date
    #  if date >= Date.current
    #     date
    #  else
    #     invalid date
    #  end
    # end
end