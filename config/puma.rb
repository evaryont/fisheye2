environment ENV['RACK_ENV'] || 'development'
port ENV['PORT'] || '8080'
quiet
threads 1, 16
workers 3

preload_app!
Thread.abort_on_exception = true

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end
