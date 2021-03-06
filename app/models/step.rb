class Step < ActiveRecord::Base
    belongs_to :dip
    has_many :step_elements, :dependent => :destroy
    has_many :comments, as: :commentable
    
    validates :description, presence: true,
               length: {minimum: 10, maximum: 300}
               
    attr_accessor :name
end