$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'require_all'
require 'dotenv'
Dotenv.load
require_all 'lib'
