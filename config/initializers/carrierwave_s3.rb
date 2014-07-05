
CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => ENV["S3_KEY"],                        # required
      :aws_secret_access_key  => ENV["S3_SECRET"]                        # required
    }
    config.fog_directory  = 'oceanfood'                     # required bucket name    
    config.storage = :fog  
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  else
    config.storage = :file
  end
end
