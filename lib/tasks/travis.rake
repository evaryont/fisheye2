desc 'Run a full test suite, used by Travis-CI'
task :travis => %w[db:setup spec brakeman:run rubocop reek]
