require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test? || Rails.env.production?
    CarrierWave.configure do |config|
      config.storage = :file
    end
  end

  # CarrierWave.configure do |config|
  #   config.fog_provider = 'fog/google'                        # required
  #   config.fog_credentials = {
  #     provider:                         'Google',
  #     google_storage_access_key_id:     'GOOGI2H52PX2RUYEYFSB',
  #     google_storage_secret_access_key: 'BC4uqQFyxuuQEZ+dH3o3pFVLC8ZwT9PL5V8oXcdZ'
  #   }
  #   config.fog_directory = 'blush-back-bucket'

	# config.fog_directory  = '<bucket name goes here>'               # required
	# config.fog_host       = 'https://assets.example.com'           # optional, defaults to nil
	# config.fog_public     = false                                  # optional, defaults to true
	# config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
