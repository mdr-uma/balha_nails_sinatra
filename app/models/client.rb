class Client < ActiveRecord::Base
    has_secure_password
    has_many :services

end