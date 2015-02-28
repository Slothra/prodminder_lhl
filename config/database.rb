configure do
  # Log queries to STDOUT in development
  if Sinatra::Application.development?
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  end

  # set :database, {
  #   adapter: "sqlite3",
  #   database: "db/db.sqlite3"
  # }

# Heroku Configuration
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  encoding: 'unicode',
  pool: 5,
  database: 'dbh9gb1kt8q6i0',
  username: 'rfkycrnkxmofri',
  password: 'm_1tczh9mWMJR3B_RmulTctNxC',
  host: 'ec2-23-21-231-14.compute-1.amazonaws.com',
  port: 5432,
  min_messages: 'error'
)

  # Load all models from app/models, using autoload instead of require
  # See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
  Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
    filename = File.basename(model_file).gsub('.rb', '')
    autoload ActiveSupport::Inflector.camelize(filename), model_file
  end

end
