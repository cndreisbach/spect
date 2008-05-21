Gem::Specification.new do |s|
  s.name = %q{spect}
  s.version = "0.1.0"

  s.specification_version = 2 if s.respond_to? :specification_version=

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Clinton R. Nixon of Viget Labs"]
  s.date = %q{2008-05-21}
  s.description = %q{Spect is a set of wrappers for Test::Unit assertions so that you can write assertions in a more BDD-like syntax. You can use it with any Test::Unit-derived framework. I intended it to be enjoyable to use with Shoulda (http://thoughtbot.com/projects/shoulda).}
  s.email = %q{clinton.nixon@viget.com}
  s.extra_rdoc_files = ["History.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "lib/spect.rb", "lib/spect/expectations.rb", "lib/spect/expecting.rb", "spect.gemspec", "tasks/ann.rake", "tasks/bones.rake", "tasks/gem.rake", "tasks/manifest.rake", "tasks/notes.rake", "tasks/post_load.rake", "tasks/rdoc.rake", "tasks/rubyforge.rake", "tasks/setup.rb", "tasks/test.rake", "test/test_spect.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/crnixon/spect}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{spect}
  s.rubygems_version = %q{1.1.0}
  s.summary = %q{Spect is a set of wrappers for Test::Unit assertions so that you can write assertions in a more BDD-like syntax}
  s.test_files = ["test/test_spect.rb"]
end
