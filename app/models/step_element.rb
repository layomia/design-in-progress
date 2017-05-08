class StepElement < ActiveRecord::Base
    belongs_to :step
    has_many :comments, as: :commentable
    
    has_attached_file :image,
    :storage => :s3,
    :bucket => ENV['S3_BUCKET_NAME'],
    :path => "/step_elements/:id/:filename",
    :s3_credentials => {
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    },
    :styles => {
      :sm_display => '370x208#',
      :md_display => '740x416'
    }
    
    validates_attachment :image, presence: true
    do_not_validate_attachment_file_type :image
    validates :image, :unless => "image.queued_for_write[:original].blank?", dimensions: { width: 1920, height: 1080 }
end