class StepElement < ActiveRecord::Base
    belongs_to :step
    
    has_attached_file :image,
    :storage => :s3,
    :bucket => ENV['S3_BUCKET_NAME'],
    :path => "/step_elements/:id/:filename",
    :s3_credentials => {
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }
    
    do_not_validate_attachment_file_type :image
end