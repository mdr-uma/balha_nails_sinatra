class Client < ActiveRecord::Base
    has_secure_password
    has_many :appointments
    validates :email, uniqueness: true
end