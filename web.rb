require 'sinatra'
require 'sinatra/reloader' if development?
require 'pony'
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
