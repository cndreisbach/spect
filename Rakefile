require 'rake/testtask'

task :default => :test

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/test_*.rb']
  t.verbose = true
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "spect"
    s.email = "crnixon@gmail.com"
    s.authors = ["Clinton R. Nixon"]
    s.summary = "An alternate, BDD-inspired, way to write assertions in Ruby that works with Test::Unit and all its kin."
    s.description = "An alternate, BDD-inspired, way to write assertions in Ruby that works with Test::Unit and all its kin."
    s.homepage = "http://github.com/crnixon/spect"
  end
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end

