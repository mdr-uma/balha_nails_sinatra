class Client < ActiveRecord::Base
    has_secure_password
    has_many :appointments
    validates :email, uniqueness: true
    
    # validates :name, format: {with: /\A[a-zA-Z]+\z/, message: "only allows letters"}
end