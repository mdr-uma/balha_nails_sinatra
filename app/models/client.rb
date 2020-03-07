class Client < ActiveRecord::Base
    has_secure_password
    has_many :appointments
    validates :email, uniqueness: true
    
    # validates :legacy_code, format: {with: /\A[a-zA-Z]+\z/, 
    # message: "only allows letters"}
end