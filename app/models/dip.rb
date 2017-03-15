class Dip < ActiveRecord::Base
    belongs_to :user
    has_many :steps
    has_and_belongs_to_many :users
    
    validates :name, presence: true, 
               length: {minimum: 1, maximum: 25}
    
    validates :description, presence: true,
               length: {minimum: 10, maximum: 300}
end