# config/initializers/redis.rb
REDIS = Redis.new(url: ENV['REDIS_URL'] || 'redis://localhost:6379/1')
