class Order < ActiveRecord::Base
    belongs_to :customer
    
    #validations
    validates :name, presence: true
	validates :po_no, presence: true
	validates :po_date, presence: true
	validates :due_date, presence: true
end
