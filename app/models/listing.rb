class Listing < ActiveRecord::Base
  has_attached_file :photo, 
    :s3_protocol => :https,
    :url =>':s3_domain_url',
    :path => '/:class/:attachment/:id_partition/:style/:filename'
  #   :storage => :dropbox,
  #   :dropbox_credentials => { app_key: ENV['APP_KEY'],
  #                             app_secret: ENV['APP_SECRET'],
  #                             access_token: ENV['ACCESS_TOKEN'],
  #                             access_token_secret: ENV['ACCESS_TOKEN_SECRET'],
  #                             user_id: ENV['USER_ID'],
  #                             access_type: 'app_folder'}
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  belongs_to :user
  geocoded_by :full_street_address  
  after_validation :geocode
  
  def full_street_address
    [address, city, state].compact.join(', ')
  end  
end
