desc 'Run a full test suite, used by Travis-CI'
task :travis => %w[db:migrate db:test:prepare spec brakeman:run rubocop]
