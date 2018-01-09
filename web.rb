require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/flash'
enable :sessions
require './message.rb'
require './themoviedb.rb'

get '/' do
  @movies = ["Enter a movie."]
  erb :index
end

post '/' do
  @movies = movie_search(params[:movie])
  @titles = @movies[0]
  @ids = @movies[1]
  @overviews = @movies[2]
  @years = @movies[3]
  @posters = @movies[4]

  erb :index
end

get '/contact' do
  erb :contact
end

post '/contact' do
  send_message
  flash[:notice] = "Thank you for your message. We'll be in touch soon."
  redirect to('/contact')
end
