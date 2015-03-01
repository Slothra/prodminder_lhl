require 'rake'
require "sinatra/activerecord/rake"
require ::File.expand_path('../config/environment', __FILE__)

require_relative 'lib/screenings_importer'
require_relative 'lib/conditions_importer'

Rake::Task["db:create"].clear
Rake::Task["db:drop"].clear

# NOTE: Assumes SQLite3 DB
desc "create the database"
task "db:create" do
  touch 'd6a6nh023e9c9m'
end

desc "drop the database"
task "db:drop" do
  rm_f 'd6a6nh023e9c9m'
end

desc "import screenings"
task "db:populatescreenings" do
  ScreeningsImporter.new.import
end

desc "import conditions"
task "db:populateconditions" do
  ConditionsImporter.new.import
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end
