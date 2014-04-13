namespace :db do
  desc 'Rebuild the database by deleting everything and starting from scratch'
  task :rebuild => %w[db:drop db:setup]
end
