class Step < ActiveRecord::Base
    belongs_to :dip
    
    validates :description, presence: true,
               length: {minimum: 10, maximum: 300}
end