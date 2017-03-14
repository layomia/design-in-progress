class User < ActiveRecord::Base
    
    # This method associates the attribute ":avatar" with a file attachment
    has_attached_file :avatar, styles: {
        thumb: '100x100>',
        square: '200x200#',
        medium: '300x300>'
    }
    
    before_save {self.email = email.downcase}
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :first_name, presence: true, 
               length: {minimum: 5, maximum: 25}
               
    validates :last_name, presence: true,
               length: {minimum: 5, maximum: 25}
    
    validates :username, presence: true, 
               uniqueness: {case_sensitive: false}, 
               length: {minimum: 5, maximum: 25}
    
    validates :email, presence: true,
               length: {maximum: 105}, 
               uniqueness: {case_sensitive: false},
               format: {with: VALID_EMAIL_REGEX}
               
    validates :major, presence: true

    enum year: [ :first_year, :second_year, :third_year, :fourth_year, :fifth_year, :masters, :phd]
    
    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
    
    has_secure_password
end