class Step < ActiveRecord::Base
    validates :description, presence: true,
               length: {minimum: 10, maximum: 300}
end