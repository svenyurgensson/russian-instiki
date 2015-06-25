Encoding.default_internal = 'utf-8'
Encoding.default_external = 'utf-8'
ENV['TZ']='UTC'

begin
  # Set up load paths for all bundled gems
  ENV["BUNDLE_GEMFILE"] = File.join(File.dirname(File.dirname(__FILE__)), 'Gemfile')
  require 'bundler/setup'
rescue Bundler::GemNotFound
  raise RuntimeError, "Bundler couldn't find some gems." +
    "Did you run `bundle install`?"
end
