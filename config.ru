require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/contrib'
require_relative './controllers/song_controller.rb'

use Rack::Reloader
use Rack::MethodOverride

run App
