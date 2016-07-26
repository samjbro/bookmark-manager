require 'rubygems'
require 'data_mapper' # requires all the gems listed above

DataMapper.setup(:default, 'postgres://AppsDJ@localhost/bookmarks')

class Link
  include DataMapper::Resource

  property :id,         Serial
  property :title,      Text
  property :URL,        Text
end
