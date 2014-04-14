desc 'Run a full test suite, used by Travis-CI'
task :travis => %w[spec brakeman:run rubocop]
