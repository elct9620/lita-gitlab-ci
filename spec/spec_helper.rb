require "simplecov"
require "coveralls"
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start { add_filter "/spec/" }

require "lita-gitlab-ci"
require "lita/rspec"

# From lita-gitlab
# File: https://github.com/milo-ft/lita-gitlab/blob/master/spec%2Fspec_helper.rb
def fixture_file(filename)
  return '' if filename == ''
  file_path = File.expand_path("#{File.dirname(__FILE__)}/fixtures/#{filename}.json")
  File.read(file_path)
end
