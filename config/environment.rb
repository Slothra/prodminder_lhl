# for dev
require 'pry'

# for back-end
require 'active_support/all'
require 'sinatra'
require 'sinatra/activerecord'

# for front-end
require 'slim'
require 'compass'
require 'breakpoint'
require 'susy'

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

# Sinatra's variables
set :app_file, __FILE__
set :root, APP_ROOT.to_path
set :views, File.join(Sinatra::Application.root, "app", "views")
set :public_folder, 'public'

configure do
  set :server, :puma

  enable :sessions
  set :session_secret, ENV['SESSION_KEY'] || 'lighthouselabssecret'

  # Ruby Slim
  set :slim, {
    format: :html,
    pretty: true,
    use_html_safe: true,
    tabsize: 2
  }

  # Compass
  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
    config.sass_dir = 'views'
  end

  set :sass, Compass.sass_engine_options
  set :scss, Compass.sass_engine_options
end

# Set up the database and models
require APP_ROOT.join('config', 'database')

# Load the routes / actions
require APP_ROOT.join('app', 'actions')
