ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '../..', 'app/app.rb')

require 'capybara'
require 'capybara/rspec'
# require './app/models/link'
require './app/app'

Capybara.app = BookmarkManager

