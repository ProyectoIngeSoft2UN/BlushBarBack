require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test? || Rails.env.production?
    CarrierWave.configure do |config|
      config.storage = :file
    end
  end

	# config.fog_credentials = {
  #     :provider               => 'AWS',
  #     :aws_access_key_id      => "YOUR AMAZON ACCESS KEY",
  #     :aws_secret_access_key  => "YOUR AMAZON SECRET KEY",
  #     :region                 => 'us-west-1' # Change this for different AWS region. Default is 'us-east-1'
  # }

	# config.fog_directory  = '<bucket name goes here>'               # required
	# config.fog_host       = 'https://assets.example.com'           # optional, defaults to nil
	# config.fog_public     = false                                  # optional, defaults to true
	# config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
