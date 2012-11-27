require 'bundler'
Bundler.require

require 'logger'
require 'open-uri'

class SinatraApp < Sinatra::Base
  configure do
    use SprockAssets, compile: true
    set :root, File.expand_path(File.join(File.dirname(__FILE__), '../'))
    set :views, 'app/views'
  end
end
