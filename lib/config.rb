require 'bundler'
Bundler.require

require 'logger'
require 'open-uri'

class SinatraApp < Sinatra::Base
  configure :development do
    use SprockAssets
  end

  configure do
    set :root, File.expand_path(File.join(File.dirname(__FILE__), '../'))
    set :views, 'app/views'
  end
end
