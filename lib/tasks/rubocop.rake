require 'rubocop/rake_task'

task :rubocop => %w[rubocop:style rubocop:rails]

namespace :rubocop do
  desc 'Run RuboCop, the ruby style checker'
  Rubocop::RakeTask.new(:style) do |task|
    task.formatters = ['clang']
    task.fail_on_error = true
  end

  desc 'Run RuboCop Rails checks'
  Rubocop::RakeTask.new(:rails) do |task|
    task.formatters = ['clang']
    task.fail_on_error = true
    task.options = ['-R']
  end

  desc 'Run RuboCop lint checks'
  Rubocop::RakeTask.new(:lint) do |task|
    task.formatters = ['clang']
    task.fail_on_error = true
    task.options = ['-l']
  end
end
