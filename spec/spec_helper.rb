require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start
require 'require_all'
require 'dotenv'
Dotenv.load
require_rel '../lib'
