require 'rubygems'
require 'data_mapper'

class Link
  include DataMapper::Resource
  property :id,         Serial
  property :title,      Text
  property :url,        Text
end

DataMapper.setup(:default, 'postgres://localhost/bookmark_manager_test')
DataMapper.finalize
DataMapper.auto_upgrade!
