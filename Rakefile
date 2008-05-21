# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.

load 'tasks/setup.rb'

ensure_in_path 'lib'
require 'spect'

task :default => 'test:run'

PROJ.name = 'spect'
PROJ.authors = 'Clinton R. Nixon of Viget Labs'
PROJ.email = 'clinton.nixon@viget.com'
PROJ.url = 'http://github.com/crnixon/spect'
PROJ.rubyforge.name = 'spect'
PROJ.version = Spect::VERSION
PROJ.exclude = ['.git']

PROJ.spec.opts << '--color'

# EOF
