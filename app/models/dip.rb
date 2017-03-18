class Dip < ActiveRecord::Base
    belongs_to :user
    has_many :steps, :dependent => :destroy
    
    validates :name, presence: true, 
               length: {minimum: 1, maximum: 40}
               
    attr_accessor :description
    attr_accessor :step_elements
end