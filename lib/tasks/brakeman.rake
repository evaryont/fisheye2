namespace :brakeman do

  desc "Run Brakeman, the basic security scanner"
  task :run, :output_files do |t, args|
    require 'brakeman'

    files = args[:output_files].split(' ') if args[:output_files]
    report = Brakeman.run :app_path => ".", :output_files => files, :print_report => true

    if report.checks.all_warnings.length != 0
      puts "Found #{report.checks.all_warnings.length} security warnings, should be 0."
      puts "Found #{report.errors.length} parse errors (these can be ignored)."
      fail "!!! Brakeman found warnings that need to be fixed !!!"
    end
  end
end
