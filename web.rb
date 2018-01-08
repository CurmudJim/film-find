require 'sinatra'
require 'sinatra/reloader' if development?
require './themoviedb.rb'
require './scraper.rb'


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
  if @movies != []
    @links = @titles.collect { |title| shop(title) }
  end
  erb :index
end
