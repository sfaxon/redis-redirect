redis_config_path = Rails.root.join('redis.yml') # in a real app this should be under Rails.root 'config'
configurations = YAML.load_file(redis_config_path)
redis_env_config = configurations[Rails.env].symbolize_keys

RedisRedirect.redis = Redis.connect(redis_env_config)

if redis_env_config.has_key?(:namespace)
  RedisRedirect.redis.namespace = redis_env_config[:namespace]
else
  RedisRedirect.redis.namespace = "redirect"  # default is redis_redirect
end
