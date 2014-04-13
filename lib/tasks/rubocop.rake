require 'rubocop/rake_task'

desc 'Run RuboCop, the ruby style checker'
Rubocop::RakeTask.new(:rubocop) do |task|
  task.formatters = ['clang']
  task.fail_on_error = true
end
