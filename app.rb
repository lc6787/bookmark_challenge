require 'sinatra/base'
require 'sinatra/reloader'
require './models/bookmark_manager.rb'

class BookmarkManager < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

get '/' do
  erb :index
end

get '/bookmarks' do
  @saved_bookmarks = BookmarkEntry.all
  erb :bookmarks
end

get '/add-bookmark' do
  erb :add_bookmark
end

post '/saved-bookmark'do
  BookmarkEntry.create(params[:bookmark_url], params[:name])
  redirect '/bookmarks'
end

run! if app_file == $0

end