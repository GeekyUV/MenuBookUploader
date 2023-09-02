idekiq.configure_server do |config|
    config.redis = { url: 'redis://127.0.0.1:6379/0' }
  end
  
  Sidekiq.configure_client do |config|
    config.redis = { url: 'redis://127.0.0.1:6379/0' }
  end
  
  if defined?(Sidekiq)
    require 'sidekiq/web'
  
    Sidekiq::Web.use(Rack::Auth::Basic) do |username, password|
      username == 'yuvi' && password == 'yuvi123'
    end
  end