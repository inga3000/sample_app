if Rails.env.development? || Rails.env.test?
  $redis = Redis.new(:host => 'localhost', :port => 6379)
elsif Rails.env.production?
  $redis = Redis.new(host: 'pub-redis-11935.us-east-1-3.6.ec2.redislabs.com',
  	                 port: 11935)	
end  

#redis://rediscloud:obufgVlN5oRHD8p1@pub-redis-11935.us-east-1-3.6.ec2.redislabs.com:11935