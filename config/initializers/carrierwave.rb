if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider => 'AWS',
      :region => ENV['S3_REGION'],
      :aws_access_key_id => ENV['S3_ACCESS_KEY'],
      :aws_secret_access_key => ENV['S3_SECRET_KEY']
    }
    config.fog_directory = ENV['S3_BUCKET']
    
    # 公開・非公開の切り替え
    config.fog_public     = true
    # キャッシュの保存期間
    config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
  end
end


