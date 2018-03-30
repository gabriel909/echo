# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

#use Rack::SSL if ENV['FORCE_SSL'] == '1'

run Rails.application
