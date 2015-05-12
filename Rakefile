# -*- encoding: utf-8 -*-

require 'bundler/gem_tasks'

begin
  require 'yard'
  YARD::Rake::YardocTask.new do |t|
    #t.files   = ['lib/**/*.rb']
    #t.options = ['--any', '--extra', '--opts']
    #t.stats_options = ['--list-undoc']
  end
rescue LoadError
  task :yardoc do
    abort "YARD is not available. In order to run yardoc, you must: sudo gem install yard"
  end
end
