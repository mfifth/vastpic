CarrierWave.configure do |config|
	config.fog_credentials = {
	  :provider               => 'AWS',                        # required
	  :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],                        # required
	  :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],                     # required
	  :region                 => ENV['AWS_REGION']                  # optional, defaults to 'us-east-1'
	}
	 config.fog_directory  = ENV['S3_BUCKET_NAME']                             # required
	 config.s3_access_policy = :public_read
end