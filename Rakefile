@default_driver = 'phantom.js'
@browsers = %w(phantomjs firefox chrome)

def use_driver(driver)
  ENV['DRIVER'] = driver || @default_driver
end

def run(driver, suite)
  use_driver driver
  puts "Running using #{ENV['DRIVER']}"
  system('cucumber -t @' + suite +' -t ~@ignore')
  fail 'build failed!' unless $?.exitstatus == 0
end

def parallel_run(driver, suite)
  use_driver driver
  puts "Running in parallel using #{ENV['DRIVER']}"
  system('bundle exec parallel_cucumber ./ -o "-t @' + suite + ' -t ~@ignore"')
  fail 'build failed!' unless $?.exitstatus == 0
end

task :phantomjs, [:arg1] do |t, args|
  run 'phantomjs', args.arg1
end

task :firefox, [:arg1] do |t, args|
  run 'firefox', args.arg1
end

task :chrome, [:arg1] do |t, args|
  run 'chrome', args.arg1
end

task :browserstack, [:arg1] do |t, args|
  run 'browserstack', args.arg1
end

task :crossbrowser, [:arg1] do |t, args|
  @browsers.each { |browser| Rake::Task[browser].invoke args.arg1}
end

task :parallel_phantomjs, [:arg1] do |t, args|
  parallel_run 'phantomjs', args.arg1
end

task :parallel_firefox, [:arg1] do |t, args|
  parallel_run 'firefox', args.arg1
end

task :parallel_chrome, [:arg1] do |t, args|
  parallel_run 'chrome', args.arg1
end

task :parallel_crossbrowser, [:arg1] do |t, args|
  @browsers.each { |browser| Rake::Task['parallel_' + browser].invoke args.arg1}
end