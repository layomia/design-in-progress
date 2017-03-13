class Dip < ActiveRecord::Base
    validates :name, presence: true, 
               length: {minimum: 1, maximum: 25}
    
    validates :description, presence: true,
               length: {minimum: 10, maximum: 300}
end