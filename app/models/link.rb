require 'rubygems'
require 'data_mapper'
require 'database_cleaner'
require_relative 'db_setups'


class Link
  include DataMapper::Resource

  has n, :tags, through: Resource
  property :id,         Serial
  property :title,      Text
  property :url,        Text
end

db_setup
