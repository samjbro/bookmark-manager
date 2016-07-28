ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/' do
    redirect '/links/index'
  end

  get '/links/index' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links/index' do
    link = Link.create(title: params[:title], url: params[:url])
    params[:tag].split.each do |tag|
      link.tags << Tag.create(name: tag)
    end
    link.save
    redirect '/links/index'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

   run! if app_file == $0
end