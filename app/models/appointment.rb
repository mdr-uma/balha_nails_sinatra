class Appointment < ActiveRecord::Base
    belongs_to :client
end