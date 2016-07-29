ENV['RACK_ENV'] ||= 'development'
require_relative 'data_mapper_setup'
require 'sinatra/base'
#require_relative 'models/link'


class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/links' do
    @links = Link.all
    @tag = Tag.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
     link = Link.create(url: params[:url], title: params[:title])
     params[:tags].split.each do |tag|
       link.tags << Tag.create(name: tag)
     end
     link.save
     redirect '/links'
  end

  get "/tags/:name" do
    tag = Tag.first(:name, params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get "/users/sign_up" do
    erb :'users/sign_up'
  end
  post "/users/sign_up" do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/links'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
