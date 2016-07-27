def db_setup
  require 'data_mapper'
  require 'dm-postgres-adapter'
  require 'tag'
  require 'link'

  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
  DataMapper.finalize
  DataMapper.auto_upgrade!
end
