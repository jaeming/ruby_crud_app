require 'active_record'
require_relative './models/post'
require_relative './queries/post_query'

def db_configuration
  db_configuration_file = File.join(File.expand_path('..', __FILE__), '..', 'db', 'config.yml')
  YAML.load(File.read(db_configuration_file))
end
 
ActiveRecord::Base.establish_connection(db_configuration["development"])

return if ARGV.empty?

payload = JSON.parse(ARGV.first).deep_symbolize_keys
query = PostQuery.new(payload[:params])
action = payload[:action].to_sym

query.send(action) if query.respond_to?(action)
