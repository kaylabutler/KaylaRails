if Rails.env.production?
	$redis = Redis.new(url: ENV["REDIS_URL"])
elsif
	$redis = Redis.new(:host => 'localhost', :port => 6379)
end