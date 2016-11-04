Paperclip::Attachment.default_options[:storage] = :s3
Paperclip::Attachment.default_options[:s3_credentials] = { :bucket  =>  APP_CONFIG['s3_bucket'], :access_key_id  => APP_CONFIG['s3_access_key_id'], :secret_access_key  =>  APP_CONFIG['s3_secret_access_key'] }
