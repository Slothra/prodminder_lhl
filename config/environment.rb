# for dev
require 'pry'

# for back-end
require 'active_support/all'
require 'sinatra'
require 'sinatra/activerecord'
require 'mailgun'
require 'dotenv'

# for front-end
require 'slim'
require 'compass'
require 'breakpoint'
require 'susy'
require 'autoprefixer-rails'

# Globals
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

# Load DotENV environment variables
Dotenv.load

configure do
  # Sinatra's variables
  set :app_file, __FILE__
  set :root, APP_ROOT.to_path
  set :views, File.join(Sinatra::Application.root, "app", "views")
  set :public_folder, 'public'

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
    config.project_path = APP_ROOT.to_path
    config.sass_dir = 'views/stylessheets'
    config.css_dir = "/views/stylesheets"
    config.fonts_dir = "/views/fonts"
    config.sass_dir = "/views/stylesheets"
    config.images_dir = "/public/images/"

    config.images_path = "/public/images/"
    config.javascripts_dir = "/public/javascripts/"
    config.http_path = "/"
    config.http_javascripts_dir = "javascripts"
    config.http_stylesheets_dir = "stylesheets"
    config.http_images_dir = "images"
    config.http_fonts_dir = "fonts"
    config.relative_assets = true
    config.color_output = true
    config.disable_warnings = true
  end

  set :sass, Compass.sass_engine_options
  set :scss, Compass.sass_engine_options
end

# Set up the database and models
require APP_ROOT.join('config', 'database')

# Load the routes / actions
require APP_ROOT.join('app', 'actions')
