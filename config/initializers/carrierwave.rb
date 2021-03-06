CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV["aws_access_id"],
    aws_secret_access_key: ENV["aws_access_secret_key"]
  }

  config.cache_dir = "#{Rails.root}/tmp/uploads"
  config.fog_directory  = ENV['S3_BUCKET_NAME']
  config.fog_public     = false
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
  config.storage = :fog
end
