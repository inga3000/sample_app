if Rails.env.development? || Rails.env.test?
  $redis = Redis.new(:host => 'localhost', :port => 6379)
elsif Rails.env.production?  
  if ENV["REDISCLOUD_URL"]
    $redis = Redis.new(:url => ENV["REDISCLOUD_URL"])
  end
end  
