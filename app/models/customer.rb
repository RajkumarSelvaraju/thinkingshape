class Customer < ActiveRecord::Base
    
    has_many :orders
    
    # Validations
	validates :fname, presence: true
	validates :lname, presence: true
	validates :company, presence: true
	validates :mobile, presence: true
	validates :email, presence: true
	
end
